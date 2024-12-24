-- utils/indent-xml.lua

-- this function add return after xml declaration
local function fix_declaration_and_root()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  if #lines > 0 and lines[1]:match("^<%?xml") then
    if lines[1]:find("><") then
      local parts = vim.split(lines[1], "><", true)
      lines[1] = parts[1] .. ">"
      table.insert(lines, 2, "<" .. parts[2])
      vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
      print("Saut de ligne ajouté entre la déclaration XML et l'élément racine.")
    end
  end
end

-- this function reformat xml file with xalan parser
local function indent_xml_with_xalan()
  vim.cmd('write') -- save file before indent

  local file_path = vim.fn.expand('%:p')
  local temp_file = vim.fn.tempname()
  local xalan_jar = os.getenv("HOME") .. "/files/xalan/xalan-j_2_7_3/xalan.jar"
  local xsl_file = os.getenv("HOME") .. "/files/t.xsl"

  local command = string.format(
    "java -cp %s org.apache.xalan.xslt.Process -in %s -xsl %s -out %s > /dev/null 2>&1",
    xalan_jar, file_path, xsl_file, temp_file
  )

  local result = os.execute(command)

  if result ~= 0 then
    print("Erreur : La commande Xalan a échoué.")
    return
  end

  if not vim.loop.fs_stat(temp_file) then
    print("Erreur : Le fichier temporaire n'a pas été généré.")
    return
  end

  -- load content from temp file
  local temp_content = vim.fn.readfile(temp_file)
  if not temp_content or vim.tbl_isempty(temp_content) then
    print("Erreur : Le fichier temporaire est vide ou inaccessible.")
    return
  end

  -- replace bufR content with temp file
  vim.api.nvim_buf_set_lines(0, 0, -1, false, temp_content)

  fix_declaration_and_root()

  -- delete temp file
  os.remove(temp_file)
  print("Indentation XML terminée avec succès.")
end

-- Cmd
vim.api.nvim_create_user_command("IndentXML", indent_xml_with_xalan, {})

-- /utils/xml-templates.lua
--
-- Fonction pour charger un template donné dans le buffer actuel
local function load_template(template_name)
  local base_path = vim.fn.expand("~/.config/user-utils/xml/templates/")
  local template_path = base_path .. template_name

  local file = io.open(template_path, "r")
  if not file then
    vim.notify("Template file not found: " .. template_path, vim.log.levels.ERROR)
    return
  end

  local content = file:read("*a")
  file:close()

  vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(content, "\n"))
  vim.notify("Template loaded from: " .. template_path, vim.log.levels.INFO)
end

-- Fonction pour lister les fichiers disponibles dans le dossier des templates
local function list_templates(ArgLead)
  local base_path = vim.fn.expand("~/.config/user-utils/xml/templates/")
  local files = vim.fn.glob(base_path .. ArgLead .. "*", false, true)
  return vim.tbl_map(function(path)
    return vim.fn.fnamemodify(path, ":t") -- Retourne seulement le nom du fichier
  end, files)
end

-- Commande Neovim avec complétion automatique
vim.api.nvim_create_user_command("LoadTemplate", function(args)
  load_template(args.args)
end, {
  nargs = 1, -- Un seul argument est requis
  complete = list_templates
})


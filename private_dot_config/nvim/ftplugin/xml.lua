-- réglages pour l'indentation des fichiers XML
vim.bo.smartindent = false
vim.bo.autoindent = false
vim.cmd([[filetype indent off]]) 
vim.cmd([[TSDisable indent]])

vim.bo.tabstop = 4      -- 1 tab = 4 espaces
vim.bo.shiftwidth = 4   -- 4 espaces pour l'indentation automatique
vim.bo.expandtab = true -- convertir les tabs en espaces

vim.keymap.set({ "n", "v" }, "=", indent_xml_with_xalan, { buffer = true, noremap = true, silent = true })

-- core/options.lua
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.statusline:append("%y%f")

vim.opt.swapfile = false

vim.opt.spell = true
vim.opt.spelllang = { "fr", "en" }

vim.opt.smartindent = false

vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 99
vim.opt.foldenable = true

vim.wo.number = true

vim.g.mapleader = " "

vim.cmd("filetype plugin on")
vim.api.nvim_create_autocmd("FileType", {
    pattern = "tex",
    callback = function()
        vim.bo.syntax = "on" -- Utilise la syntaxe Vim classique
    end,
})


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

vim.wo.number = true

vim.g.mapleader = " "

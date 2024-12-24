vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set statusline+=%y%f")
vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false

vim.opt.spell = true
vim.opt.spelllang = {"fr", "en"}

vim.o.smartindent = false
-- Navigate vim panes better

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true

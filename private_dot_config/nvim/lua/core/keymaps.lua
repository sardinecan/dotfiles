-- core/keymaps
-- nvim navigation
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- copy to clipboard
vim.keymap.set('v', '<leader>y', '"+y', {})

-- deactivate search highlight
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { noremap = true, silent = true })

-- keymaps for LSP are defined in plugins.lspconfig

-- indent xml files
vim.api.nvim_set_keymap('n', '<leader>f', ':IndentXML<CR>', { noremap = true, silent = true })

-- interaction nvim / wezterm
vim.api.nvim_set_keymap("n", "<leader>r", ":lua SendLineToWezTerm()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>r", ":lua SendSelectionToWezTerm()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bd", ":BufferClose<CR>", { desc = "Fermer le buffer actuel" })


-- keymaps for neotree are defined in plugins.neotree
-- keympas for telescope are defined in plugins.telescope

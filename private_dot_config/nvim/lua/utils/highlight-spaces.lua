local function highlight_special_spaces()
  vim.api.nvim_command('highlight Nbsp guibg=lightgrey guifg=magenta')
  vim.api.nvim_command('highlight TrailingSpace guibg=lightgrey guifg=magenta')

  vim.fn.matchadd("Nbsp", [[\%u00A0]])
  vim.fn.matchadd("TrailingSpace", [[\s\+$]])
end

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"*"},
  callback = highlight_special_spaces
})

vim.o.list = true
vim.o.listchars = 'trail:·,nbsp:⎵'


-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")
vim.g.onedark_termcolors=16
vim.cmd.colorscheme "onedark"
vim.keymap.set('v', '<leader>y', '"+y', {})

vim.opt.spell = true
vim.opt.spelllang = {"fr", "en"}

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

--[[vim.api.nvim_create_autocmd("FileType", {
  pattern = {"markdown", "tex", "txt", "html", "xml"},
  callback = function ()
    vim.opt_local.spell = true
  end
})]]--

--[[vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    local bufname = vim.fn.bufname()
    if vim.bo.filetype == "neo-tree" or bufname:match("neo%-tree") then
      vim.opt_local.spell = false
    end
  end
})]]--

--- lance automatiquement neotree au démarrage de neovim 
-- vim.api.nvim_create_autocmd("UIEnter", {command="Neotree filesystem reveal left"})

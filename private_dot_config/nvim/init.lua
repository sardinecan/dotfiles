-- init.lua
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

require("core.options") -- needs to be loaded before lazy because of leader keymap

require("lazy").setup("plugins")
require("core.keymaps")
require("core.appearance")

require("utils.highlight-spaces")
require("utils.nvim-wezterm")
require("utils.indent-xml")
require("utils.xml-templates")

--- lance automatiquement neotree au démarrage de neovim 
-- vim.api.nvim_create_autocmd("UIEnter", {command="Neotree filesystem reveal left"})

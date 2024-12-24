return  {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {
        "css",
        "html",
        "javascript",
        "julia",
        "lua",
        "markdown",
        "python",
        "vim",
        "vimdoc",
        "xml"
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}

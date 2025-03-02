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
      ignore_install = { "latex" },
      highlight = { enable = true, disable = { "latex", "xml" }, },
      indent = { enable = true },
      fold = { enable = true },
    })
  end
}

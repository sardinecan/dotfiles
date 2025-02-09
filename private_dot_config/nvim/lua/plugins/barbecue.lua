return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  dependencies = {
    "neovim/nvim-lspconfig",
    "SmiteshP/nvim-navic", -- Pour extraire les informations de breadcrumbs
  },
  opts = {
    theme = "auto",
    show_modified = true,
    attach_navic = true,
    show_dirname = true,
    show_basename = true,
    symbols = {
      modified = "●",
      separator = ">",
    },
    exclude_filetypes = { "netrw", "gitcommit", "terminal", "git", "markdown", "toggleterm" },
  },
}


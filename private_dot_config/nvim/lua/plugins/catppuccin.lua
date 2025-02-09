return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "auto", -- latte, frappe, macchiato, mocha
      background = {
        light = "latte",
        dark = "macchiato",
      },
      transparent_background = false,
      styles = {
        comments = { "italic" },
        keywords = { "bold" },
        functions = { "italic" },
        variables = {},
        strings = {},
      },
    })
  end
}


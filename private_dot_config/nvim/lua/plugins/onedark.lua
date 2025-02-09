return {
  "navarasu/onedark.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("onedark").setup({
      style = "darker", -- "dark", "darker", "cool", "deep", "warm", "warmer", "light"
      transparent = false,
      term_colors = true,

      code_style = {
        comments = "italic",
        keywords = "bold",
        functions = "italic",
        variables = "NONE",
        strings = "NONE",
      },

      -- lualine = { transparent = true }, -- Rend la barre de statut transparente
      diagnostics = {
        darker = true, -- couleurs plus sombres pour les diagnostics
        undercurl = true, -- soulignements en courbe pour erreurs
        background = true, -- fond pour les diagnostics
      }
    })
  end,
}


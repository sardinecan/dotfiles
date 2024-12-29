-- plugins/indent-blankline.lua
return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  ---@module "ibl"
  ---@type ibl.config
  opts = {
    indent = {
      char = "▏"
    },
    --[[whitespace = {
      highlight = { "Whitespace", "NonText" },
      remove_blankline_trail = false,
    },]]--
    exclude = {
      filetypes = {
        "dashboard",
        "lspinfo",
        "packer",
        "checkhealth",
        "help",
        "man",
        "gitcommit",
        "TelescopePrompt",
        "TelescopeResults",
        ''
      },
      buftypes = {
        "terminal",
        "nofile",
        "quickfix",
        "prompt"
      }
    }
  },
}


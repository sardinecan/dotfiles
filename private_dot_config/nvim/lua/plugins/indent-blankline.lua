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


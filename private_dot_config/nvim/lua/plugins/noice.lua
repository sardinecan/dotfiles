return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {},
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },

  config = function()
    local noice = require("noice")

    -- Configuration de nvim-notify avec durée réduite
    local notify = require("notify")
    notify.setup({
      background_colour = "#000000",
      timeout = 2000, -- ⏳ Notifications disparaissent après 2s
    })
    vim.notify = notify

    noice.setup({
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },

      messages = {
        view = "mini", -- Messages plus petits
      },

      notify = {
        enabled = true,
        view = "mini",
      },

      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = false, -- Empêche les longs messages de rester trop longtemps
        inc_rename = false,
        lsp_doc_border = false,
      },
    })
  end,
}


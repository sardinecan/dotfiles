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
    local notify = require("notify")
    local lualine = require("lualine")

    notify.setup({
      background_colour = "#000000",
      timeout = 2000,
    })
    vim.notify = notify

    lualine.setup({
      sections = {
        lualine_x = {
          {
            require("noice").api.statusline.mode.get,
            cond = require("noice").api.statusline.mode.has,
            color = { fg = "#ff9e64" },
          }
        },
      },
    })

    noice.setup({
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        hover = {
          enabled = false,
        },
        signature = {
          enabled = false,
        }
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
        long_message_to_split = false,
        inc_rename = false,
        lsp_doc_border = false,
      },
    })
  end,
}

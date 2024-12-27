return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Charger les couleurs de Tokyonight
    local colors = require("tokyonight.colors").setup()

    -- Configuration de bufferline
    require("bufferline").setup {
      options = {
        mode = "buffers",
        numbers = "none",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },
        separator_style = "slant",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = (level:match("error") and " ") or " "
          return icon .. count
        end,
        show_buffer_close_icons = true,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        max_name_length = 18,
        max_prefix_length = 15,
        truncate_names = true,
      },
      highlights = {
        fill = {
          fg = colors.fg_gutter,
          bg = colors.bg_dark,
        },
        background = {
          fg = colors.fg_gutter,
          bg = colors.bg,
        },
        buffer_visible = {
          fg = colors.fg_gutter,
          bg = colors.bg,
        },
        buffer_selected = {
          fg = colors.fg,
          bg = colors.bg_highlight,
          bold = true,
        },
        separator = {
          fg = colors.border,
          bg = colors.bg,
        },
        separator_visible = {
          fg = colors.border,
          bg = colors.bg,
        },
        separator_selected = {
          fg = colors.border,
          bg = colors.bg_highlight,
        },
        close_button = {
          fg = colors.fg_gutter,
          bg = colors.bg,
        },
        close_button_visible = {
          fg = colors.fg_gutter,
          bg = colors.bg,
        },
        close_button_selected = {
          fg = colors.fg,
          bg = colors.bg_highlight,
        },
        modified = {
          fg = colors.warning,
          bg = colors.bg,
        },
        modified_visible = {
          fg = colors.warning,
          bg = colors.bg,
        },
        modified_selected = {
          fg = colors.warning,
          bg = colors.bg_highlight,
        },
        error = {
          fg = colors.red,
          bg = colors.bg, -- Corrige le fond noir des erreurs
        },
        error_visible = {
          fg = colors.red,
          bg = colors.bg,
        },
        error_selected = {
          fg = colors.red,
          bg = colors.bg_highlight,
        },
        error_diagnostic = {
          fg = colors.red,
          bg = colors.bg, -- Corrige le fond noir des diagnostics d'erreurs
        },
        error_diagnostic_visible = {
          fg = colors.red,
          bg = colors.bg,
        },
        error_diagnostic_selected = {
          fg = colors.red,
          bg = colors.bg_highlight,
        },
        warning = {
          fg = colors.yellow,
          bg = colors.bg,
        },
        warning_visible = {
          fg = colors.yellow,
          bg = colors.bg,
        },
        warning_selected = {
          fg = colors.yellow,
          bg = colors.bg_highlight,
        },
        warning_diagnostic = {
          fg = colors.yellow,
          bg = colors.bg,
        },
        warning_diagnostic_visible = {
          fg = colors.yellow,
          bg = colors.bg,
        },
        warning_diagnostic_selected = {
          fg = colors.yellow,
          bg = colors.bg_highlight,
        },
        info = {
          fg = colors.blue,
          bg = colors.bg,
        },
        info_visible = {
          fg = colors.blue,
          bg = colors.bg,
        },
        info_selected = {
          fg = colors.blue,
          bg = colors.bg_highlight,
        },
        pick_selected = {
          fg = colors.red,
          bg = colors.bg_highlight,
          bold = true,
        },
        pick_visible = {
          fg = colors.red,
          bg = colors.bg,
          bold = true,
        },
        pick = {
          fg = colors.red,
          bg = colors.bg,
          bold = true,
        },
        tab = {
          fg = colors.fg_gutter,
          bg = colors.bg,
        },
        tab_selected = {
          fg = colors.fg,
          bg = colors.bg_highlight,
          bold = true,
        },
        tab_close = {
          fg = colors.red,
          bg = colors.bg, -- Corrige le fond noir derrière la croix
        },
      },
    }
  end,
}

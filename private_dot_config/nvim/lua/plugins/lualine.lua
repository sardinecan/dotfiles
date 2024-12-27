--local util = require("util")

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  end,
  screen_width = function(min_w)
    return function()
      return vim.o.columns > min_w
    end
  end,
}

local branch = {
  "branch",
  icon = "", -- Git branch icon
}

local diff = {
  "diff",
  symbols = { added = "+", modified = "~", removed = "-" }, -- Minimalistic style
  cond = conditions.screen_width(80),
}

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = { error = " ", warn = " ", info = " ", hint = " " },
  cond = conditions.screen_width(100),
}

local filename = {
  "filename",
  path = 1, -- Display filename relative to the working directory
  symbols = {
    modified = "[+]", -- Indicates a modified file
    readonly = "[-]", -- Indicates a readonly file
  },
}

local location = {
  "location",
}

local progress = {
  "progress",
}

local encoding = {
  "encoding",
  cond = conditions.screen_width(120),
}

local filetype = {
  "filetype",
  icon_only = true,
}

local spaces = {
  function()
    return "Spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
  end,
}

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      theme = "auto",
      globalstatus = true,
      component_separators = "|",
      section_separators = "",
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
    },
    sections = {
      lualine_a = { branch },
      lualine_b = { diff },
      lualine_c = { filename, diagnostics },
      lualine_x = { encoding, filetype, spaces },
      lualine_y = { location },
      lualine_z = { progress },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { filename },
      lualine_x = { location },
      lualine_y = {},
      lualine_z = {},
    },
  },
}


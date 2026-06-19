return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",

  -- Single source of truth for parsers we expect on every machine.
  ensure_installed = {
    "bash",
    "css",
    "html",
    "javascript",
    "julia",
    "lua",
    "markdown",
    "python",
    "regex",
    "vim",
    "vimdoc",
    "xml",
  },

  init = function()
    vim.treesitter.language.register("xml", { "svg", "xslt", "xhtml" })
  end,

  config = function()
    local parsers = require("plugins.treesitter").ensure_installed
    local ok_parsers, ts_parsers = pcall(require, "nvim-treesitter.parsers")
    local ok_configs, ts_configs = pcall(require, "nvim-treesitter.configs")

    -- Telescope 0.1.x may call parsers.ft_to_lang; provide compatibility on newer treesitter.
    if ok_parsers and ts_parsers and ts_parsers.ft_to_lang == nil then
      ts_parsers.ft_to_lang = function(ft)
        local ok_lang, lang = pcall(vim.treesitter.language.get_lang, ft)
        if ok_lang and lang and lang ~= "" then
          return lang
        end
        return ft
      end
    end

    -- Telescope 0.1.x may also call configs.is_enabled; provide compatibility when absent.
    if ok_configs and ts_configs and ts_configs.is_enabled == nil then
      ts_configs.is_enabled = function(module_name, lang, bufnr)
        if type(ts_configs.get_module) ~= "function" then
          return false
        end

        local ok_module, module = pcall(ts_configs.get_module, module_name)
        if not ok_module or type(module) ~= "table" then
          return false
        end

        if module.enable == false then
          return false
        end

        local disable = module.disable
        if type(disable) == "function" then
          local ok_disable, disabled = pcall(disable, lang, bufnr)
          if ok_disable and disabled then
            return false
          end
        elseif type(disable) == "table" and vim.tbl_contains(disable, lang) then
          return false
        end

        return true
      end
    end

    require("nvim-treesitter.config").setup({
      ensure_installed = parsers,
      auto_install = true,
      ignore_install = { "latex" },

      highlight = {
        enable = true,
        disable = function(lang, buf)
          if lang == "latex" then
            return true
          end

          if lang == "xml" then
            local max_filesize = 800 * 1024
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end

          return false
        end,
      },

      indent = { enable = true },
    })

    -- Force Treesitter pour Julia
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "julia",
      callback = function()
        vim.schedule(function()
          local ok = pcall(vim.treesitter.start, 0)
          if not ok and vim.fn.exists(":TSBufEnable") == 2 then
            vim.cmd("TSBufEnable highlight")
          end
        end)
      end,
    })

    -- Ensure missing parsers are installed automatically on startup.
    vim.api.nvim_create_autocmd("VimEnter", {
      once = true,
      callback = function()
        local missing = {}
        for _, lang in ipairs(parsers) do
          local found = vim.api.nvim_get_runtime_file("parser/" .. lang .. ".so", false)
          if #found == 0 then
            table.insert(missing, lang)
          end
        end

        if #missing > 0 then
          vim.schedule(function()
            vim.cmd("TSInstall " .. table.concat(missing, " "))
          end)
        end
      end,
    })
  end,
}

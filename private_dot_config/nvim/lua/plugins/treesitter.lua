return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  init = function()
    vim.treesitter.language.register("xml", { "svg", "xslt", "xhtml" })
  end,

  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "css",
        "html",
        "javascript",
        "julia",
        "lua",
        "markdown",
        "python",
        "vim",
        "vimdoc",
        "xml",
      },
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
          vim.cmd("TSBufEnable highlight")
        end)
      end,
    })
  end,
}

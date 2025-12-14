return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  -- exécuté AVANT le chargement du plugin
  init = function()
    vim.treesitter.language.register("xml", { "svg", "xslt", "xhtml" })
  end,

  opts = {
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
        -- toujours désactivé pour LaTeX
        if lang == "latex" then
          return true
        end

        -- XML trop gros (> 800 KB)
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
  },
}

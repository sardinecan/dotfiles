return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {"lua_ls", "tsserver", "lemminx", "svelte", "julials", "html"}
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.lemminx.setup({})
      lspconfig.svelte.setup({})
      lspconfig.julials.setup({
        on_new_config = function(new_config, _)
          local julia = vim.fn.expand("~/.julia/environments/nvim-lspconfig/bin/julia")
          if require'lspconfig'.util.path.is_file(julia) then
            vim.notify("Hello!")
            new_config.cmd[1] = julia
          end
        end
      })
      lspconfig.html.setup({})

      --vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}

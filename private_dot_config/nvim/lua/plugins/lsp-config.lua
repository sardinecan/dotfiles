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
        ensure_installed = {
          "lua_ls",
          "tsserver",
          "lemminx",
          "svelte",
          "julials",
          "html",
          "cssls",
          "emmet_ls",
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local mason_lspconfig = require("mason-lspconfig")
      local lspconfig = require("lspconfig")

      -- default handler for installed servers
      mason_lspconfig.setup_handlers({
        function (serverName)
          lspconfig[serverName].setup({
            capabilities=capabilities
          })
        end
      })

      lspconfig.julials.setup({
        capabilities=capabilities,
        on_new_config = function(new_config, _)
          local julia = vim.fn.expand("~/.julia/environments/nvim-lspconfig/bin/julia")
          if require'lspconfig'.util.path.is_file(julia) then
            vim.notify("Hello!")
            new_config.cmd[1] = julia
          end
        end
      })


      --vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}

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

      --local opts = { buffer = ev.buf, silent = true }

      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
      --vim.keymap.set("n", "<leader>gI", vim.lsp.lsp_implementations, {})
      --vim.keymap.set("n", "<leader>gt", vim.lsp.lsp_type_definitions, {})
      vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", {}) -- show  diagnostics for file
      vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", {}) -- mapping to restart lsp if necessary
      vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {}) -- show diagnostics for line
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {}) -- jump to previous diagnostic in buffer
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {}) -- jump to next diagnostic in buffer
    end,
  },
}

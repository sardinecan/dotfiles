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
          "cssls",
          "emmet_ls",
          "html",
          --"julials",
          "lemminx",
          "lua_ls",
          "texlab",
          "ts_ls", -- new name for tsserver
          "svelte"
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

      local on_attach = function(_, bufnr)
        local function buf_set_option(...)
          vim.api.nvim_buf_set_option(bufnr, ...)
        end

        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        local opts = { buffer = bufnr, noremap = true, silent = true }

        vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
        vim.keymap.set('n', 'td', vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

        vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, opts)

        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)

        vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
        vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', '<leader>l', vim.diagnostic.setloclist, opts)

        vim.keymap.set({"n", "v"}, "ca", vim.lsp.buf.code_action, opts)

        vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts) -- to rename function
      end


      -- default handler for installed servers
      --[[mason_lspconfig.setup_handlers({
        function (serverName)
          lspconfig[serverName].setup({
            capabilities=capabilities,
            on_attach=on_attach
          })
        end
      })]]--

      local servers = {
        "cssls",
        "emmet_ls",
        "html",
        "lemminx",
        "texlab",
        "ts_ls",
        "svelte"
      }

      for _, server in ipairs(servers) do
        vim.lsp.config(server, {
          capabilities = capabilities,
          on_attach = on_attach,
        })
        vim.lsp.enable(server)
          end

          -- Configuration spécifique pour julials avec vim.lsp.config
          vim.lsp.config("julials", {
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = (function()
          local julia_env = vim.fn.expand("~/.julia/environments/nvim-lspconfig/bin/julia")
          
          -- Fonction pour vérifier si LanguageServer est installé
          local function check_languageserver(julia_cmd)
            local handle = io.popen(julia_cmd .. ' --startup-file=no --history-file=no -e "using LanguageServer; println(\\"OK\\")" 2>/dev/null')
            if handle then
              local result = handle:read("*a")
              handle:close()
              return result:match("OK") ~= nil
            end
            return false
          end
          
          -- Fonction pour installer LanguageServer
          local function install_languageserver(julia_cmd)
            vim.notify("Installation de LanguageServer.jl...")
            local install_cmd = julia_cmd .. ' --startup-file=no --history-file=no -e "import Pkg; Pkg.add(\\"LanguageServer\\"); Pkg.instantiate()"'
            local handle = io.popen(install_cmd .. ' 2>&1')
            if handle then
              local result = handle:read("*a")
              handle:close()
              vim.notify("Installation terminée: " .. result)
            end
          end
          
          -- Essayer d'abord l'environnement spécifique
          if vim.fn.filereadable(julia_env) == 1 then
            if check_languageserver(julia_env) then
              vim.notify("Using Julia LSP from environment: " .. julia_env)
              return { julia_env, "--startup-file=no", "--history-file=no", "-e", "using LanguageServer; runserver()" }
            else
              -- Tenter l'installation dans l'environnement spécifique
              install_languageserver(julia_env)
              if check_languageserver(julia_env) then
                return { julia_env, "--startup-file=no", "--history-file=no", "-e", "using LanguageServer; runserver()" }
              end
            end
          end
          
          -- Fallback sur l'installation globale de Julia
          local julia_global = "julia"
          if check_languageserver(julia_global) then
            vim.notify("Using global Julia installation")
            return { julia_global, "--startup-file=no", "--history-file=no", "-e", "using LanguageServer; runserver()" }
          else
            -- Installer LanguageServer globalement
            install_languageserver(julia_global)
            return { julia_global, "--startup-file=no", "--history-file=no", "-e", "using LanguageServer; runserver()" }
          end
        end)(),
          })
          vim.lsp.enable("julials")

          -- Configuration spécifique pour lua_ls
          vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = {
              -- Force le LSP à reconnaître la variable globale `vim`
              globals = { "vim" },
            },
          },
        },
      })
    vim.lsp.enable("lua_ls")

   end,
  },
}

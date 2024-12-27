return {
  {
    "lervag/vimtex",
    lazy = false,
    config = function()
      -- Configuration de VimTeX
      vim.api.nvim_create_autocmd({ "FileType" }, {
        group = vim.api.nvim_create_augroup("lazyvim_vimtex_conceal", { clear = true }),
        pattern = { "bib", "tex" },
        callback = function()
          vim.wo.conceallevel = 0
        end,
      })
      --vim.g.vimtex_view_method = "zathura" -- Exemple: spécifie le visualiseur PDF
      vim.g.vimtex_compiler_method = "latexmk" -- Utilise latexmk comme compilateur
      vim.g.vimtex_syntax_enabled = 1 -- Active la coloration syntaxique
      vim.g.vimtex_quickfix_mode = 0 -- Désactive la fenêtre Quickfix par défaut

      -- Ajuste les fichiers pour lesquels VimTeX est activé
      vim.g.vimtex_filetype = "tex"

      vim.g.vimtex_compiler_latexmk = {
        aux_dir = "./aux",
        out_dir = "./out",
      }

      -- Désactiver les messages liés à Tree-sitter si tree-sitter-cli n'est pas installé
      --vim.cmd([[
      --      augroup VimTeXDisableTreeSitterWarnings
      --      autocmd!
      --      autocmd FileType tex setlocal syntax=on
      --      augroup END
      --      ]])
    end,
  },
}

return {
  {
    "lervag/vimtex",
    lazy = false,
    config = function()
      vim.api.nvim_create_autocmd({ "FileType" }, {
        group = vim.api.nvim_create_augroup("lazyvim_vimtex_conceal", { clear = true }),
        pattern = { "bib", "tex" },
        callback = function()
          vim.wo.conceallevel = 0
        end,
      })
      --vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_syntax_enabled = 1
      vim.g.vimtex_quickfix_mode = 0

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

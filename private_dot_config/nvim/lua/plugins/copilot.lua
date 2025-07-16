return {
  "github/copilot.vim",
  lazy = true,
  cmd = { "Copilot", "Copilot enable", "Copilot disable", "Copilot status" },
  keys = {
    {
      "<leader>cp",
      "<cmd>Copilot status<CR>",
      desc = "Activer GitHub Copilot"
    },
    {
      "<leader>cP",
      "<cmd>Copilot disable<CR>",
      desc = "Désactiver GitHub Copilot"
    },
  },
}

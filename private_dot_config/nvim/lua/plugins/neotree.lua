return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      window = {
        position = "right",
        width = 30,
      }
    })
    vim.keymap.set("n", "<leader>e", ":Neotree filesystem reveal right<CR>", {}) -- open neotree panel
    vim.keymap.set("n", "<leader>q", ":Neotree close<CR>", {}) -- close neotree panel
    vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {}) -- see opened files
    vim.keymap.set("n", "<leader>gst", ":Neotree git_status reveal float<CR>", {}) -- see git status files
  end,
}


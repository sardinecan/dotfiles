return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {}) -- open neotree panel
		vim.keymap.set("n", "<leader>q", ":Neotree close<CR>", {}) -- close neotree panel
    vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {}) -- see opened files 	
    vim.keymap.set("n", "<leader>gst", ":Neotree buffers reveal float<CR>", {}) -- see opened files 
  end,
}


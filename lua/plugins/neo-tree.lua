vim.pack.add({
  "https://github.com/nvim-neo-tree/neo-tree.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/MunifTanjim/nui.nvim",
})

vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>",{ noremap = true, silent = true })
-- vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>",{ noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>fb", ":Neotree buffers reveal float<CR>")
-- vim.keymap.set("n", "<C-m>", ":Neotree filesystem close left<CR>",{ noremap = true, silent = true })

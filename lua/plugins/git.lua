vim.pack.add({
  "https://github.com/tpope/vim-fugitive",
  "https://github.com/lewis6991/gitsigns.nvim"
})
require("gitsigns").setup()

vim.keymap.set("n", "<leader>gg", ":Gitsigns preview_hunk<CR>", {})
vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})

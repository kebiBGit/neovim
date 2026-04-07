vim.pack.add({
  "https://github.com/nvim-lualine/lualine.nvim",
})
require("lualine").setup({
  options = {
    theme = "auto",
    sections = {
      lualine_a = {
        file = 1,
      },
    },
  },
})

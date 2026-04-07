vim.pack.add({
  "https://github.com/folke/which-key.nvim",
})
require("which-key").setup({
  preset = "modern",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
})

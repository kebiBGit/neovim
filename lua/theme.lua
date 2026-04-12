vim.pack.add({
  "https://github.com/navarasu/onedark.nvim",
  "https://github.com/folke/tokyonight.nvim",
})
require("onedark").setup({
  style = "deep",
  transparent = true,
  lualine = {
    transparent = true, -- lualine center bar transparency
  },
})
require("onedark").load()

require("tokyonight").setup({
style = "moon",
  light_style = "moon",
  transparent = true,
  terminal_colors = true,
})

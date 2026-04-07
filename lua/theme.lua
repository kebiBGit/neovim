vim.pack.add({
  "https://github.com/navarasu/onedark.nvim",
})
require("onedark").setup({
  style = "deep",
  transparent = true,
  lualine = {
    transparent = true, -- lualine center bar transparency
  },
})
require("onedark").load()

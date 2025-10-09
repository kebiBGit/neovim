return {
  "nvim-lualine/lualine.nvim",
  config = function()
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
  end,
}

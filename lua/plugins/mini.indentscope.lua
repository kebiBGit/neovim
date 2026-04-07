vim.pack.add({
  "https://github.com/nvim-mini/mini.indentscope",
})
init = function()
  vim.api.nvim_create_autocmd("FileType", {
    pattern = {
      "help",
      "alpha",
      "dashboard",
      "neo-tree",
      "Trouble",
      "trouble",
      "lazy",
      "mason",
      "notify",
      "toggleterm",
      "lazyterm",
    },
    callback = function()
      vim.b.miniindentscope_disable = true
    end,
  })
end
require('mini.indentscope').setup(
{
  draw = {
    delay = 0,
    predicate = function(scope) return not scope.body.is_incomplete end,
    priority = 2,
  },
  mappings = {
    object_scope = 'ii',
    object_scope_with_border = 'ai',
    goto_top = '[i',
    goto_bottom = ']i',
  },
  options = {
    border = 'both',
    indent_at_cursor = true,
    n_lines = 10000,
    try_as_border = false,
  },
  -- symbol = "│",
  -- symbol = "⣿",
  -- symbol = "⢸",
  symbol = "⡇",
})

vim.pack.add({
  "https://github.com/nvim-mini/mini.surround"
})
require('mini.surround').setup({
  custom_surroundings = nil,
  highlight_duration = 500,
  mappings = {
    add = 'gsa', -- Add surrounding in Normal and Visual modes
    delete = 'gsd', -- Delete surrounding
    find = 'gsf', -- Find surrounding (to the right)
    find_left = 'gsF', -- Find surrounding (to the left)
    highlight = 'gsh', -- Highlight surrounding
    replace = 'gsr', -- Replace surrounding
  },
  n_lines = 20,
  respect_selection_type = false,
  search_method = 'cover',
  silent = false,
})

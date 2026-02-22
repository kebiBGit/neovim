if vim.islist and vim.tbl_islist then
  vim.tbl_islist = vim.islist
end

local plugin_opts = {
  mappings = {
    add = "gsa",
    delete = "gsd",
    find = "gsf",
    find_left = "gsF",
    highlight = "gsh",
    replace = "gsr",
    update_n_lines = "gsn",
  },
}

return {
  "nvim-mini/mini.surround",
  version = "*",
  keys = function(_, keys)
    local opts = plugin_opts
    local mappings = {
      { opts.mappings.add, desc = "Add Surrounding", mode = { "n", "v" } },
      { opts.mappings.delete, desc = "Delete Surrounding" },
      { opts.mappings.find, desc = "Find Right Surrounding" },
      { opts.mappings.find_left, desc = "Find Left Surrounding" },
      { opts.mappings.highlight, desc = "Highlight Surrounding" },
      { opts.mappings.replace, desc = "Replace Surrounding" },
      { opts.mappings.update_n_lines, desc = "Update MiniSurround.config.n_lines" },
    }

    mappings = vim.tbl_filter(function(mapping)
      return mapping[1] and #mapping[1] > 0
    end, mappings)

    return vim.list_extend(mappings, keys or {})
  end,
  opts = plugin_opts,
}

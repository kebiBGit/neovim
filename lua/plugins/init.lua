local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins"

for _, file in ipairs(vim.fn.glob(plugin_dir .. "/*.lua", false, true)) do
  local name = vim.fn.fnamemodify(file, ":t:r")
  if name ~= "init" then
    local ok, err = pcall(require, "plugins." .. name)
    if not ok then
      vim.notify("Failed to load plugin config: plugins." .. name .. "\n" .. err, vim.log.levels.ERROR)
    end
  end
end

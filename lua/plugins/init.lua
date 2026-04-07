local plugins_dir = vim.fs.joinpath(vim.fn.stdpath("config"), "lua", "plugins")
local plugin_modules = {}

for name, kind in vim.fs.dir(plugins_dir) do
	if kind == "file" and name:sub(-4) == ".lua" and name ~= "init.lua" then
		table.insert(plugin_modules, "plugins." .. name:sub(1, -5))
	end
end

table.sort(plugin_modules)

for _, module_name in ipairs(plugin_modules) do
	require(module_name)
end

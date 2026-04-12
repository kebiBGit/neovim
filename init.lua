local t1 = vim.uv.hrtime()

vim.loader.enable()

require('options')
require('theme')
require('plugins')

vim.api.nvim_create_autocmd("UIEnter", {
	once = true,
	callback = function()
		vim.g.startup_time = (vim.uv.hrtime() - t1) / 1e6
	end,
})



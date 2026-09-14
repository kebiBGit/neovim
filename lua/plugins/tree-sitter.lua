vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
})
vim.pack.add({
	{ src = "https://gitlab.com/HiPhish/rainbow-delimiters.nvim.git" },
})

require("nvim-treesitter").setup({
	install_dir = vim.fn.stdpath("data") .. "/site",
})

vim.api.nvim_create_autocmd("PackChanged", {
	pattern = "nvim-treesitter",
	desc = "Run :TSUpdate after pack changed",
	group = vim.api.nvim_create_augroup("treesitter_update", { clear = true }),
	callback = function(e)
		local kind, name = e.data.kind, e.data.spec.name
		if kind == "install" or kind == "update" then
			vim.cmd.packadd({ args = { name }, bang = false })
			vim.cmd("TSUpdate")
		end
	end,
})

local parsers = {
	"lua",
	"vim",
	"vimdoc",
	"bash",
	"c",
	"cpp",
	"python",
	"latex",
	"regex",
	"javascript",
	"typescript",
	"tsx",
	"json",
	"html",
	"css",
	"markdown",
	"markdown_inline",
	"zsh",
}

require("nvim-treesitter").install(parsers)

local file_pattern = vim.list_extend(parsers, { "javascriptreact", "typescriptreact", "sh", "help", "checkhealth" })
vim.api.nvim_create_autocmd("FileType", {
	pattern = file_pattern,
	callback = function()
		vim.treesitter.start() -- highlighting
		-- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- folds
		-- vim.wo.foldmethod = "expr"
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- indentation
	end,
})

require("rainbow-delimiters.setup").setup({
	strategy = {},
	query = {},
	highlight = {},
})

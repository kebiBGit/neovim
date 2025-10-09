return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
		vim.keymap.set("n", "<leader>ff", ":Neotree filesystem reveal left<CR>", {})
		vim.keymap.set("n", "<leader>fg", ":Neotree buffers reveal float<CR>", {})
		vim.keymap.set("n", "<C-m>", ":Neotree filesystem close left<CR>",{})
	end,
}

vim.pack.add({
	"https://github.com/nvim-lualine/lualine.nvim",
})
require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			filetype = "dashboard",
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		always_show_tabline = true,
		globalstatus = false,
		refresh = {
			statusline = 80,
			tabline = 1000,
			winbar = 1000,
			refresh_time = 16, -- ~60fps
			events = {
				"WinEnter",
				"BufEnter",
				"BufWritePost",
				"SessionLoadPost",
				"FileChangedShellPost",
				"VimResized",
				"Filetype",
				"CursorMoved",
				"CursorMovedI",
				"ModeChanged",
			},
		},
	},
	sections = {
		lualine_a = {
			"mode",
			{
				function()
					local reg = vim.fn.reg_recording()
					if reg == "" then
						return ""
					end -- not recording
					return "MACRO @" .. (tostring(reg))
				end,
			},
		},
		lualine_b = {
			"branch",
			"diff",
			"diagnostics",
			{
				function()
					return "▋"
				end,
			},
		},
		lualine_c = {
			{
				"filename",
				symbols = {
					modified = "[+]", -- Text to show when the file is modified.
					readonly = "[READ_ONLY]", -- Text to show when the file is non-modifiable or readonly.
					unnamed = "[No Name]", -- Text to show for unnamed buffers.
					newfile = "[NEW_FILE]", -- Text to show for newly created file before first write
				},
			},
			"filetype",
		},
		lualine_x = {
			"encoding",
			"fileformat",
			{
				function()
					return "▋"
				end,
			},
		},
		lualine_y = {
			{
				function()
					if #vim.lsp.get_clients({ bufnr = 0 }) == 0 then
						return " LSP :  None"
					end
					return " LSP :"
				end,
			},
			{
				"lsp_status",
				icon = "",
				padding = 0,
				symbols = {
					-- Standard unicode symbols to cycle through for LSP progress:
					-- spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
					spinner = { "◜", "◠", "◝", "◞", "◡", "◜" },
					-- Standard unicode symbol for when LSP is done:
					done = "✓",
					-- Delimiter inserted between LSP names:
					separator = " | ",
				},
			},
			{
				function()
					return "▋"
				end,
			},
		},
		lualine_z = { "progress", {
			function()
				return "|"
			end,
		}, "location" },
	},
	inactive_sections = {
		lualine_a = {},
		-- lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})

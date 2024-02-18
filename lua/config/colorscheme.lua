require("tokyonight").setup({
	style = "moon",
	light_style = "day",
	transparent = true,
	terminal_colors = true,
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		sidebars = "dark",
		floats = "dark",
	},
	-- Set a darker background on sidebar-like windows
	sidebars = { "qf", "help" },
	day_brightness = 0.3,
	hide_inactive_statusline = false,
	dim_inactive = false,
	lualine_bold = false,
})

vim.cmd([[colorscheme tokyonight]])

-- colour of columnline on right side
vim.cmd("highlight ColorColumn guibg=#361440")

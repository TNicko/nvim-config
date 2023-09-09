require("tokyonight").setup({

	style = "moon",
	light_style = "day",
	transparent = true,
	terminal_colors = true,
	styles = {
		-- Style to be applied to different syntax groups
		-- Value is any valid attr-list value for `:help nvim_set_hl`
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		-- Background styles. Can be "dark", "transparent" or "normal"
		sidebars = "dark", -- style for sidebars, see below
		floats = "dark", -- style for floating windows
	},
	-- Set a darker background on sidebar-like windows.
	-- For example: `["qf", "vista_kind", "terminal", "packer"]`
	sidebars = { "qf", "help" },
	-- Adjusts the brightness of the colors of the **Day** style.
	-- Number between 0 and 1, from dull to vibrant colors
	day_brightness = 0.3,
	-- Enabling this option, will hide inactive statuslines and replace
	-- them with a thin border instead. Should work with the standard
	-- **StatusLine** and **LuaLine**.
	hide_inactive_statusline = false,
	dim_inactive = false, -- dims inactive windows
	-- When `true`, section headers in the lualine theme will be bold
	lualine_bold = false,
})

vim.cmd([[colorscheme tokyonight]])

-- colour of columnline on right side
vim.cmd("highlight ColorColumn guibg=#361440")

-- background transparency
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

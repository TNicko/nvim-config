local lualine = require("lualine")
local lualine_palenight = require('lualine.themes.palenight')

local new_colors = {
	blue = "#41e2f0",
	green = "#9cde28",
	violet = "#f589aa",
	yellow = "#FFDA7B",
	black = "#000000",
}

lualine_palenight.normal.a.bg = new_colors.blue
lualine_palenight.insert.a.bg = new_colors.green
lualine_palenight.visual.a.bg = new_colors.violet
lualine_palenight.command = {
	a = {
		gui = "bold",
		bg = new_colors.yellow,
		fg = new_colors.black,
	},
}

lualine.setup({
	options = {
		theme = lualine_palenight
	}
})

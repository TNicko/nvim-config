-- recommended settings from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
	renderer = {
		icons = {
			show = {
				folder_arrow = false,
			},
		},
	},
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
	filters = {
		dotfiles = false,
		git_ignored = false,
		--custom = { ".git", "node_modules", ".cache" },
	},
})

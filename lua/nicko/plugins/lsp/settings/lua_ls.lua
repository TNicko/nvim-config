return {
	settings = {
		Lua = {
			-- make language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				-- will not ask about luassert configuration
				checkThirdParty = false,
			},
			-- Do not send telemtry data containing randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}

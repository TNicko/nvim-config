local servers = {
	"lua_ls",
	--"tsserver",
	--"html",
	"svelte",
	"pyright",
	--"cssls",
	--"tailwindcss",
	--"jsonls",
	--"bashls",
	--"yamlls",
}

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("nicko.plugins.lsp.lspconfig").on_attach,
		capabilities = require("nicko.plugins.lsp.lspconfig").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "nicko.plugins.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end

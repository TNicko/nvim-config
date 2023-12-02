local servers = {
	"lua_ls",
	"tsserver",
	"rust_analyzer",
	--"html",
	"svelte",
	"pyright",
	--"cssls",
	--"tailwindcss",
	--"jsonls",
	--"bashls",
	--"yamlls",
}

local setup, rt = pcall(require, "rust-tools")
if not setup then
	return
end

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

local lsp_config = require("nicko.plugins.lsp.lspconfig")

for _, server in pairs(servers) do
	opts = {
		on_attach = lsp_config.on_attach,
		capabilities = lsp_config.capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "nicko.plugins.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end
	lspconfig[server].setup(opts)
end

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("nicko.plugins.lsp.mason")
require("nicko.plugins.lsp.lspconfig").setup()
require("nicko.plugins.lsp.null-ls")
require("nicko.plugins.lsp.lspsaga")

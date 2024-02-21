local servers = {
	"lua_ls",
	"rust_analyzer",
	"pyright",
	"tsserver",
}

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = servers,
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup {}
		end,
	},
})

for _, server in pairs(servers) do
	if server == "pyright" then
		require('lspconfig')["pyright"].setup {
			capabilities = capabilities,
			settings = {
				python = {
					analysis = {
						typeCheckingMode = "off",
					}
				}
			}
		}
	else
		require('lspconfig')[server].setup {
			capabilities = capabilities,
		}
	end
end

-- LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, opts)
	end,
})

-- Diagnostics
local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
	virtual_text = true,
	signs = { active = signs },
	update_in_insert = true,
	underline = true,
	severity_sort = true,
}
vim.diagnostic.config(config)

-- Formatting

local prettier_servers = {
	["tsserver"] = true,
	["html"] = true,
	["cssls"] = true,
}

local format_is_enabled = false
vim.api.nvim_create_user_command('KickstartFormatToggle', function()
	format_is_enabled = not format_is_enabled
	print('Setting autoformatting to: ' .. tostring(format_is_enabled))
end, {})

-- Augroup used for managing our formatting autocmds.
local _augroups = {}
local get_augroup = function(client)
	if not _augroups[client.id] then
		local group_name = 'kickstart-lsp-format-' .. client.name
		local id = vim.api.nvim_create_augroup(group_name, { clear = true })
		_augroups[client.id] = id
	end
	return _augroups[client.id]
end

-- When LSP attaches to buffer, run this function
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('kickstart-lsp-attach-format', { clear = true }),
	callback = function(args)
		local client_id = args.data.client_id
		local client = vim.lsp.get_client_by_id(client_id)
		local bufnr = args.buf


		if client.name == "pyright" then
			vim.api.nvim_create_autocmd(
				"BufWritePost", {
					group = get_augroup(client),
					buffer = bufnr,
					callback = function()
						if not format_is_enabled then
							return
						end
						local black_cmd = "black --quiet --fast --line-length 79 " ..
								vim.api.nvim_buf_get_name(bufnr)
						vim.fn.system(black_cmd)
						vim.cmd("edit!")
					end,
				}
			)
			return
		end


		if prettier_servers[client.name] then
			vim.api.nvim_create_autocmd(
				"BufWritePost", {
					group = get_augroup(client),
					buffer = bufnr,
					callback = function()
						if not format_is_enabled then
							return
						end
						local prettier_cmd = "prettier --write " .. vim.api.nvim_buf_get_name(bufnr)
						vim.fn.system(prettier_cmd) -- Pass the command directly as a string
						vim.cmd("edit!")
					end,
				}
			)
			return
		end

		-- tsserver usually works poorly, so disabled
		if client.name == 'tsserver' then
			return
		end


		-- Only attach to clients that support document formatting
		if not client.server_capabilities.documentFormattingProvider then
			return
		end

		-- Create an autocmd that will run *before* we save the buffer.
		-- Run formatting cmd for LSP that has just attached
		vim.api.nvim_create_autocmd('BufWritePre', {
			group = get_augroup(client),
			buffer = bufnr,
			callback = function()
				if not format_is_enabled then
					return
				end

				-- Use the LSP's formatting
				vim.lsp.buf.format {
					async = false,
					filter = function(c)
						return c.id == client.id
					end,
				}
			end,
		})
	end
})

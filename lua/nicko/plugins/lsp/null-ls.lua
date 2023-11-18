local null_ls_status, null_ls = pcall(require, "null-ls")
if not null_ls_status then
	return
end

local formatting = null_ls.builtins.formatting
--local diagnostics = null_ls.builtins.diagnostics
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local sources = {
	formatting.prettier.with({
		filetypes = {
			"javascript",
			"typescript",
			"css",
			"html",
			"json",
			"markdown",
			"svelte",
			"yaml",
			"markdown",
			"txt",
			"react",
			"md",
			"typescriptreact",
		},
		disabled_filetypes = { "python" },
		extra_args = {
			"--print-width",
			"79",
			"--no-semi",
			"--single-quote",
			"--jsx-single-quote",
		},
	}),
	formatting.black.with({
		extra_args = {
			"--preview", -- !!! Disable if seeing buggy formatting !!!
			"--fast",
			"--line-length",
			"79",
			--"--experimental-string-processing",
		},
	}),
	formatting.rustfmt,
	formatting.stylua,
	--diagnostics.flake8,
	--diagnostics.eslint_d.with({
	---- only enable eslint if root has .eslintrc.js
	--condition = function(utils)
	--return utils.root_has_file(".eslintrc.json") -- change file extension if you use something else
	--end,
	--}),
}

null_ls.setup({
	debug = false,
	sources = sources,
	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						bufnr = bufnr,
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
					})
				end,
			})
		end
	end,
})

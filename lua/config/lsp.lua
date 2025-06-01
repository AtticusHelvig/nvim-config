vim.lsp.enable("lua_ls")
vim.lsp.enable("pyright")
vim.lsp.enable("omnisharp")
vim.lsp.enable("rust_analyzer")

-- Custom keybinds
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set('n', '<C-Space>', '<C-x><C-o>', opts)
		vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
		vim.keymap.set({ 'n', 'x' }, 'gq', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)

		vim.keymap.set('n', 'grt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
		vim.keymap.set('n', 'grd', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
	end,
})


vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		if client ~= nil and client:supports_method('textDocument/formatting') then
			vim.api.nvim_create_autocmd('BufWritePre', {
				buffer = args.buf,
				callback = function()
					vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
				end,
			})
		end
	end,
})

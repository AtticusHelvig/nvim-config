vim.lsp.enable("lua_ls")
vim.lsp.enable("pyright")
vim.lsp.enable("omnisharp")
vim.lsp.enable("rust_analyzer")

vim.api.nvim_create_autocmd('LspAttach', {
	-- Custom keybinds
	callback = function(event)
		local map = function(keys, func, desc, mode)
			mode = mode or 'n'
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
		end

		map('grn', vim.lsp.buf.rename, '[R]e[n]ane')
		map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
		map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
		map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
		map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
		map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
		map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')
		map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open [W]orkspace Symbols')
		map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

		-- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
		---@param client vim.lsp.Client
		---@param method vim.lsp.protocol.Method
		---@param bufnr? integer some lsp support methods only in specific files
		---@return boolean
		local function client_supports_method(client, method, bufnr)
			if vim.fn.has 'nvim-0.11' == 1 then
				return client:supports_method(method, bufnr)
			else
				return client.supports_method(method, { bufnr = bufnr })
			end
		end

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		-- The following code creates a keymap to toggle inlay hints in your
		-- code, if the language server you are using supports them
		--
		-- This may be unwanted, since they displace some of your code
		if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
			map('<leader>th', function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
			end, '[T]oggle Inlay [H]ints')
		end
		-- Diagnostic Config
		-- See :help vim.diagnostic.Opts
		vim.diagnostic.config {
			severity_sort = true,
			float = { border = 'rounded', source = 'if_many' },
			underline = {
				severity = {
					min = vim.diagnostic.severity.WARN
				}
			},
			signs = vim.g.have_nerd_font and {
				text = {
					[vim.diagnostic.severity.ERROR] = ' ',
					[vim.diagnostic.severity.WARN] = ' ',
					[vim.diagnostic.severity.INFO] = ' ',
					[vim.diagnostic.severity.HINT] = '󰌵 ',
				},
			} or {},
		}
	end,
})

-- Format on save
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

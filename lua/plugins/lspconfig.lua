return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "mason-org/mason.nvim", "mason-org/mason-lspconfig.nvim" },
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "LspInfo", "LspInstall", "LspUninstall" }
	}
}

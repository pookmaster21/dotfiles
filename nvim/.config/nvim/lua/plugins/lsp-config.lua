return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"cssls",
					"dockerls",
					"eslint",
					"hls",
					"jsonls",
					"lua_ls",
					"ruby_lsp",
					"rust_analizer",
					"tailwindcss",
					"ts_ls",
					"zls",
					"jdtls",
					"hyprls",
					"gopls",
					"clangd",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
		end,
	},
}

return {
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
			ensure_installed = {
				"rust_analyzer",
				"black",
				"isort",
				"clang-format",
				"codelldb",
				"debugpy",
				"delve",
				"gofumpt",
				"goimports-reviser",
				"golines",
				"gomodifytags",
				"mypy",
				"prettier",
				"rubocop",
				"stylua",
			},
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {
				"cssls",
				"dockerls",
				"eslint",
				"hls",
				"jsonls",
				"lua_ls",
				"ruby_lsp",
				"tailwindcss",
				"ts_ls",
				"zls",
				"jdtls",
				"hyprls",
				"pyright",
				"gopls",
				"clangd",
				"bashls",
			},
		},
	},
	{
		"RubixDev/mason-update-all",
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
		},
		config = function()
			require("mason-update-all").setup({})
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

			lspconfig.cssls.setup({
				capabilities = capabilities,
			})

			lspconfig.dockerls.setup({
				capabilities = capabilities,
			})

			lspconfig.eslint.setup({
				capabilities = capabilities,
			})

			lspconfig.hls.setup({
				capabilities = capabilities,
			})

			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})

			lspconfig.ruby_lsp.setup({
				capabilities = capabilities,
			})

			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
			})

			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.zls.setup({
				capabilities = capabilities,
			})

			lspconfig.jdtls.setup({
				capabilities = capabilities,
			})

			lspconfig.hyprls.setup({
				capabilities = capabilities,
			})

			lspconfig.gopls.setup({
				capabilities = capabilities,
			})

			lspconfig.pyright.setup({
				capabilities = capabilities,
			})

			lspconfig.clangd.setup({
				capabilities = capabilities,
			})

			lspconfig.bashls.setup({
				capabilities = capabilities,
			})
		end,
	},
}

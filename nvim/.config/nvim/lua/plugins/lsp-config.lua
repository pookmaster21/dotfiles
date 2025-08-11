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
		automatic_enable = true,
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

			vim.lsp.config("*", {
				capabilities = capabilities,
			})
		end,
	},
}

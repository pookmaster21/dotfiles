return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			local ensure_installed = {
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
			}

			local registry = require("mason-registry")

			for _, pkg_name in pairs(ensure_installed) do
				if registry.has_package(pkg_name) then
					local ok, pkg = pcall(registry.get_package, pkg_name)
					if ok then
						if pkg:get_installed_version() ~= pkg:get_latest_version() then
							pkg:install()
						end
					end
				end
			end
		end,
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

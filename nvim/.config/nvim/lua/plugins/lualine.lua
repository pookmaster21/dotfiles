return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("lualine").setup({
			theme = "auto",
			sections = {
				lualine_c = {
					"filename",
					function()
						return "  LSP: " .. vim.lsp.get_clients()[1].name
					end,
				},
			},
		})
	end,
}

return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local gitsigns = require("gitsigns")

			gitsigns.setup({})

			vim.keymap.set("n", "<leader>gh", gitsigns.preview_hunk, {})
			vim.keymap.set("n", "<leader>gb", gitsigns.toggle_current_line_blame, {})
		end,
	},
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gi", ":Git init<CR>", {})
			vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", {})
			vim.keymap.set("n", "<leader>gp", ":Git push<CR>", {})
		end,
	},
}

return {
	"akinsho/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim",
	},
	keys = {
		{ "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "flutter code action" },
	},
	config = true,
}

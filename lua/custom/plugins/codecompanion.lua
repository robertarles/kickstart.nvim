return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("codecompanion").setup({
			adapters = {
				acp = {
					claude_code = function()
						return require("codecompanion.adapters").extend("claude_code", {
							env = {
								CLAUDE_CODE_OAUTH_TOKEN = vim.env.CLAUDE_CODE_OAUTH_TOKEN,
							},
						})
					end,
				},
			},
			strategies = {
				chat = { adapter = "claude_code" },
				inline = { adapter = "claude_code" },
				cmd = { adapter = "claude_code" },
			},
			display = {
				chat = {
					window = {
						layout = "vertical",
					},
				},
			},
		})
	end,
	keys = {
		{ "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle Chat" },
		{ "<leader>aa", "<cmd>CodeCompanionActions<cr>", desc = "Actions", mode = { "n", "v" } },
		{ "<leader>ai", "<cmd>CodeCompanion<cr>", desc = "Inline prompt", mode = { "n", "v" } },
	},
}

return {
	--[[ {
		"kiddos/gemini.nvim",
		cmd = { "Gemini", "GeminiChat", "GeminiCodeReview" },
		build = {
			"pip install -r requirements.txt",
			":UpdateRemotePlugins",
		},
		opts = {
			model_config = { temperature = 0.2 },
			chat_config = {
				enabled = true,
				window_config = {
					position = "right",
					width = 0.25,
				},
			},
		},
		keys = {
			{
				"<leader>ag",
				function()
					local p = vim.fn.input("Gemini> ")
					if #p > 0 then
						vim.cmd("GeminiChat " .. vim.fn.shellescape(p, true))
					end
				end,
				desc = "Gemini: Chat (Prompt)",
			},
			{
				"<leader>ag",
				function()
					local visual_selection = require("utils").get_visual_selection()
					vim.cmd("GeminiChat " .. vim.fn.shellescape(visual_selection, true))
				end,
				mode = "v",
				desc = "Gemini: Chat (Visual)",
			},
			{ "<leader>ar", "<cmd>GeminiCodeReview<cr>", desc = "Gemini: Code Review" },
			{
				"<leader>ad",
				"<cmd>GeminiDoc<cr>",
				desc = "Gemini: Generate Docs",
			},
			{ "<leader>ac", "<cmd>vsplit | terminal gemini -a -c<cr>", desc = "Gemini-CLI" },
		},
	}, ]]
}

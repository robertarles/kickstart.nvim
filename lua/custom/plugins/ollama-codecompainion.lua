local hostname = vim.loop.os_gethostname()
-- moriarty CPU spins out of control with tabnine running

if string.find(hostname, "DISABLE") then
	return {
		{
			"olimorris/codecompanion.nvim",
			config = function()
				require("codecompanion").setup({
					adapters = {
						-- Disable Copilot to avoid token errors
						copilot = false,

						-- Define the Ollama adapter
						ollama = function()
							return require("codecompanion.adapters").extend("ollama", {
								schema = {
									model = { default = "deepseek-coder:6.7b" },
									num_ctx = { default = 16384 },
									num_predict = { default = -1 },
								},
							})
						end,
					},

					-- Map the Ollama adapter to the strategies
					strategies = {
						chat = { adapter = "ollama" },
						inline = { adapter = "ollama" },
						agent = { adapter = "ollama" },
					},

					-- Optional: Customize display options
					display = {
						chat = {
							window = { layout = "vertical" }, -- Options: float|vertical|horizontal|buffer
						},
					},

					-- Optional: Add a custom system prompt
					-- opts = {
					-- 	system_prompt = function(adapter)
					-- 		if adapter.schema.model.default == "llama3:latest" then
					-- 			return "You are a helpful coding assistant."
					-- 		end
					-- 		return "Default system prompt."
					-- 	end,
					-- },
				})
			end,
		},
	}
else
	return {}
end

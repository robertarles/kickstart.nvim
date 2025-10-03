local hostname = vim.loop.os_gethostname()
if string.find(hostname, "terminus") then
	return {
		{
			"github/copilot.vim",
			config = function()
				vim.g.copilot_no_tab_map = true
				vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
				vim.api.nvim_set_keymap("i", "<C-k>", "copilot#Dismiss()", { silent = true, expr = true })
			end,
		},
	}
end
return {}

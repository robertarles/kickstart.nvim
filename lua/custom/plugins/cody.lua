local hostname = vim.loop.os_gethostname()
-- moriarty CPU spins out of control with tabnine running
if string.find(hostname, "moriarty") then
	return {
		{
			"sourcegraph/sg.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
				-- [[ "nvim-telescope/telescope.nvim" ]]
			},
			config = function()
				require("sg").setup({
					enable_cody = true,
					cody = {
						enable_autocomplete = true,
					},
				})
			end,
		},
	}
end

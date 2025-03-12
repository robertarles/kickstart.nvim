local hostname = vim.loop.os_gethostname()
-- moriarty CPU spins out of control with tabnine running
if string.find(hostname, "moriarty_DISABLED") then
	return {
		{
			"codota/tabnine-nvim",
			build = "./dl_binaries.sh",
			config = function()
				require("tabnine").setup({
					disable_auto_comment = true,
					accept_keymap = "<Tab>",
					dismiss_keymap = "<C-]>",
					debounce_ms = 800,
					suggestion_color = { gui = "#808080", cterm = 244 },
					exclude_filetypes = { "TelescopePrompt", "NvimTree" },
					log_file_path = nil,
					ignore_certificate_errors = false,
				})
			end,
		},
	}
else
	return {}
end

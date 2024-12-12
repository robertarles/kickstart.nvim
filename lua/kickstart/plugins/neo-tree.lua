-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		--"3rd/image.nvim",
	},
	cmd = "Neotree",
	keys = {
		{ "\\", ":Neotree reveal<CR>", desc = "NeoTree reveal" },
	},
	opts = {
		-- close nvim when NeoTree is the last window
		follow_current_file = true,
		use_libuv_file_watcher = true,
		auto_close = true,
		window = {
			position = "left",
			width = 30,
		},
		filesystem = {
			window = {
				position = "left",
				mappings = {
					["\\"] = "close_window",
					["l"] = "open",
				},
			},
		},
		buffers = {
			show_unloaded = true,
			window = "left",
			follow_current_file = {
				enabled = true, -- This will find and focus the file in the active buffer every time
				--              -- the current file is changed while the tree is open.
				leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
			},
		},
	},
}

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
	init = function()
		-- Close Neovim when neo-tree is the last window
		vim.api.nvim_create_autocmd("BufEnter", {
			group = vim.api.nvim_create_augroup("NeoTreeAutoClose", { clear = true }),
			callback = function()
				local wins = vim.api.nvim_list_wins()
				if #wins == 1 and vim.bo.filetype == "neo-tree" then
					vim.cmd("quit")
				end
			end,
		})
	end,
	opts = {
		window = {
			position = "left",
			width = 30,
		},
		filesystem = {
			use_libuv_file_watcher = true,
			follow_current_file = { enabled = true },
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

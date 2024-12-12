return {
	{
		"nvim-neotest/neotest",
		dependencies = { "sidlatau/neotest-dart" },
		opts = function(_, opts)
			-- Initialize opts.adapters if it is nil
			opts.adapters = opts.adapters or {}
			table.insert(
				opts.adapters,
				require("neotest-dart")({
					command = "fvm flutter",
					use_lsp = true,
					custom_test_method_names = { "testWidgets" },
				})
			)
		end,
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			dap.adapters.dart = {
				type = "executable",
				command = "fvm flutter",
				args = { "debug_adapter" },
			}
			dap.configurations.dart = {
				{
					type = "dart",
					request = "launch",
					name = "Launch Dart Program",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
			}
		end,
	},
}
-- return {
-- 	{
-- 		"nvim-neotest/neotest",
-- 		dependencies = {
-- 			"nvim-lua/plenary.nvim",
-- 			"nvim-treesitter/nvim-treesitter",
-- 			"antoinemadec/FixCursorHold.nvim",
-- 			"nvim-telescope/telescope.nvim",
-- 			"sidlatau/neotest-dart",
-- 			"nvim-neotest/nvim-nio",
-- 			{ "fredrikaverpil/neotest-golang", version = "*" }, -- Installation
-- 		},
-- 		config = function()
-- 			require("neotest").setup({
-- 				adapters = {
-- 					require("neotest-golang"),
-- 					require("neotest-dart")({
-- 						command = "fvm flutter",
-- 						use_lsp = true,
-- 						custom_test_method_names = {},
-- 					}),
-- 				},
-- 				log_level = vim.log.DEBUG,
-- 				consumers = {},
-- 				discovery = { enabled = true, concurrent = 0 },
-- 				icons = {
-- 					passed = "✔",
-- 					failed = "✖",
-- 					running = "⟳",
-- 				},
-- 				quickfix = {
-- 					enabled = true, -- Enable quickfix integration
-- 					open = false, -- Auto-open quickfix on failure
-- 				},
-- 				output = {
-- 					enabled = true, -- Enable output
-- 					open_on_run = "short", -- Show test output in a floating window
-- 				},
-- 				highlights = {
-- 					passed = "NeotestPassed", -- Highlight for passed tests
-- 					failed = "NeotestFailed", -- Highlight for failed tests
-- 					running = "NeotestRunning", -- Highlight for running tests
-- 					skipped = "NeotestSkipped", -- Highlight for skipped tests
-- 					unknown = "NeotestUnknown", -- Highlight for unknown test state
-- 				},
-- 				floating = {
-- 					border = "rounded", -- Border style for floating windows (rounded, single, double, etc.)
-- 					max_height = 0.8, -- Maximum height of floating windows
-- 					max_width = 0.8, -- Maximum width of floating windows
-- 				},
-- 				strategies = {
-- 					integrated = {
-- 						height = 40, -- Height of the terminal window when running tests
-- 						width = 120, -- Width of the terminal window
-- 					},
-- 				},
-- 				run = {
-- 					auto_attach = true, -- Automatically attach to running tests
-- 				},
-- 				summary = {
-- 					enabled = true, -- Enable the summary window
-- 					follow = true, -- Automatically follow the cursor in the summary
-- 					expand_errors = true, -- Automatically expand errors in the summary
-- 					mappings = {
-- 						expand = { "o", "<CR>" }, -- Key mappings to expand test groups
-- 						run = "r", -- Key mappings to run tests
-- 						stop = "s", -- Key mappings to stop tests
-- 					},
-- 				},
-- 			})
-- 		end,
-- 	},
-- }

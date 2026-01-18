-- return {
-- 	{
-- 		"neovim/nvim-lspconfig",
-- 		---@class PluginLspOpts
-- 		opts = {
-- 			---@type lspconfig.options
-- 			servers = {
-- 				denols = {
-- 					root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc"),
-- 				},
-- 				tsserver = {
-- 					root_dir = require("lspconfig.util").root_pattern("package.json"),
-- 					single_file_support = false,
-- 				},
-- 			},
-- 		},
-- 	},
-- }
return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	opts = {
		settings = {
			tsserver_file_preferences = {
				includeInlayParameterNameHints = "all",
				includeInlayVariableTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
			},
			expose_as_code_action = { "fix_all", "add_missing_imports", "remove_unused" },
		},
	},
	-- {
	-- 	"neovim/nvim-lspconfig",
	-- 	dependencies = { "nvim-lua/plenary.nvim" },
	-- 	config = function()
	-- 		local lspconfig = require("lspconfig")
	--
	-- 		-- Helper function to check if a file exists in the workspace
	-- 		local function has_file(filename)
	-- 	return vim.fn.glob(filename) ~= ""
	-- end

	-- Set up Deno LSP
	-- lspconfig.denols.setup({
	-- 	root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
	-- 	on_attach = function(client, bufnr)
	-- 		-- Disable formatting if you have other formatters, e.g., null-ls
	-- 		client.server_capabilities.documentFormattingProvider = false
	-- 	end,
	-- 	init_options = {
	-- 		enable = true,
	-- 		lint = true,
	-- 		unstable = false,
	-- 	},
	-- })

	-- Set up TypeScript LSP (ts_ls)
	-- lspconfig.ts_ls.setup({
	-- 	root_dir = lspconfig.util.root_pattern("package.json"),
	-- 	on_attach = function(client, bufnr)
	-- 		-- Disable formatting if you use a dedicated formatter like prettier
	-- 		client.server_capabilities.documentFormattingProvider = false
	-- 	end,
	-- })

	-- Automatically switch between denols and ts_ls
	-- vim.api.nvim_create_autocmd("LspAttach", {
	-- 	callback = function(args)
	-- 		local client = vim.lsp.get_client_by_id(args.data.client_id)
	-- 		local root_files = { "deno.json", "deno.jsonc", "package.json" }
	-- 		local root = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1])
	--
	-- 		if client.name == "denols" and vim.fn.glob(root .. "/package.json") ~= "" then
	-- 			-- If both `deno.json` and `package.json` exist, prefer ts_ls
	-- 			client.stop()
	-- 		elseif client.name == "ts_ls" and vim.fn.glob(root .. "/deno.json") ~= "" then
	-- 			-- If both `deno.json` and `package.json` exist, prefer denols
	-- 			client.stop()
	-- 		end
	-- 	end,
	-- })
	-- 	end,
	-- },
}

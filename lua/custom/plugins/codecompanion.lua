return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("codecompanion").setup({
      adapters = {
        http = {
          anthropic = function()
            return require("codecompanion.adapters").extend("anthropic", {
              schema = {
                model = {
                  default = "claude-sonnet-4-20250514",
                },
              },
            })
          end,
        },
      },
      strategies = {
        chat = { adapter = "anthropic" },
        inline = { adapter = "anthropic" },
        cmd = { adapter = "anthropic" },
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

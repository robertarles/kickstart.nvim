return {
  {
    'robertarles/taskra.nvim',
    ft = 'markdown',
    lazy = true,

    -- dir = "user.plugins.taskra", -- This points to the file we created
    config = function()
      local taskra = require 'taskra'
      -- Setup the plugin
      taskra.setup()

      taskra.add_syntax_rule('\\[BUG\\]', 'TaskraRed')
      taskra.add_syntax_rule('\\[TODO\\]', 'TaskraYellow')
      -- [TODO] -- Add text manipulation functions
      taskra.add_text_function('upper', function()
        local line = vim.api.nvim_get_current_line()
        vim.api.nvim_set_current_line(line:upper())
      end)
    end,
  },
}

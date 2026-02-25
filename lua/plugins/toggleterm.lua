return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    start_in_insert = true,
    dependencies = {
      {
        dir = "C:/Users/willk/projects/lua/neovim/termprofiles",
        dev = true,
        opts = {
          profiles = require("settings.terminal.profiles"),
          cycle_left = [[<C-h>]],
          cycle_right = [[<C-l>]]
        },
        enabled = function()
          return true --vim.env.MSYSTEM == nil
        end
      }
    },
    opts = {
      --shell = vim.o.shell,
      open_mapping = [[<c-\>]],
      close_on_exit = false,
      direction = "float",
      float_opts = {
        border = "curved",
      },
      on_open = function(term)
        if pcall(require, "termprofiles") then
          require("termprofiles").enable_profile_cycling(term)
        end
      end
    },
  }
}


local default_options = {
  shell = vim.o.shell,
  cmdflag = vim.o.shellcmdflag,
  redir = vim.o.shellredir,
  quote = vim.o.shellquote,
  xescape = vim.o.shellxescape,
  xquote = vim.o.shellxquote,
  pipe = vim.o.shellpipe,
}

local msys2_options = {
  shell = "C:/msys64/usr/bin/bash.exe",
  cmdflag = "-c -l",
  redir = ">%s 2>&1",
  quote = "",
  xescape = "",
  xquote = "",
  pipe = "2>&1| tee",

  env = {
    TMP = "/tmp",
    CHERE_INVOKING = 1,
    MSYSTEM = "MINGW64"
  }
}

local powershell_options = {
  shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
  cmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
  redir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
  pipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
  quote = "",
  xquote = "",
}

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
          profiles = {
            { name="default", opts=default_options }, 
            { name="msys2", opts=msys2_options }, 
            { name="powershell", opts=powershell_options }
          },
          cycle_left = [[<C-h>]],
          cycle_right = [[<C-l>]]
        }
      }
    },
    opts = {
      shell = vim.o.shell,
      open_mapping = [[<c-\>]],
      --close_on_exit = false,
      direction = "float",
      float_opts = {
        border = "curved",
      },
      on_open = function(term)
        require("termprofiles").enable_profile_cycling(term)
      end
    },
  }
}

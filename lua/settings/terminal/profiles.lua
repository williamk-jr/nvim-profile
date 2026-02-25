
local default_options = {}
if vim.env.MSYSTEM == nil then
  default_options = {
    shell = vim.o.shell,
    cmdflag = vim.o.shellcmdflag,
    redir = vim.o.shellredir,
    quote = vim.o.shellquote,
    xescape = vim.o.shellxescape,
    xquote = vim.o.shellxquote,
    pipe = vim.o.shellpipe,
  }
else
  default_options = {
    shell = "bash",
    cmdflag = "-c",
    --redir = ">%s 2>&1",
    --slash = true,
    quote = "",
    --xescape = "",
    xquote = '',
    --pipe = "2>&1| tee %s",
  }
end

return {
  { 
    name="default", 
    opts=default_options 
  },
  { 
    name="powershell",
    opts={
      shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell",
      cmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
      redir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
      pipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
      quote = "",
      xquote = "",
    }
  }
}

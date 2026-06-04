--require("terminal")
require("config.lazy")

require("autokeys")
require("settings")
--require("lazygit")

--vim.lsp.config("clangd", {
--  cmd = {"clangd.exe", "--background-index"}
--})

require("nvim-treesitter").install({"lua"})

vim.ui.input = function(opts, on_confirm)
  return require("snacks").Snacks.input({
    prompt = opts.prompt,
    default = opts.default,
    secret = true, -- This conceals the input
  }, on_confirm)
end

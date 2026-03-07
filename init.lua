--require("terminal")
require("config.lazy")

require("autokeys")
require("settings")
require("lazygit")

--vim.lsp.config("clangd", {
--  cmd = {"clangd.exe", "--background-index"}
--})

require("nvim-treesitter").install({"lua"})

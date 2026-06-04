--require("terminal")
require("config.lazy")

require("autokeys")
require("settings")
--require("lazygit")

--vim.api.nvim_set_keymap("n", [[<C-h>]], "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap=true,silent=true}
--vim.api.nvim_set_hl(0, 'BlinkCmpSignatureHelpActiveParameter', { link = 'CursorLine' });

require("nvim-treesitter").install({"lua"})

vim.ui.input = function(opts, on_confirm)
  return require("snacks").Snacks.input({
    prompt = opts.prompt,
    default = opts.default,
    secret = true, -- This conceals the input
  }, on_confirm)
end

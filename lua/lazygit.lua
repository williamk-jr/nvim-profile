local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  close_on_exit=true,
  hidden = true
})

function _toggle_lazygit()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", [[<C-g>]], "<cmd>lua _toggle_lazygit()<CR>", {noremap=true,silent=true})

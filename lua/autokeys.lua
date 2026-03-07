vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if pcall(require, "neo-tree") then
      vim.cmd("Neotree show")
    end
  end
})

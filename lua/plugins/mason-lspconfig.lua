local get_lsps = function()
  local lsps = require("settings.lsp.configs")
  local keys = {}

  for key, _ in pairs(lsps) do
    table.insert(keys, key)
  end
  return keys
end

return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      automatic_enable = true,
      ensure_installed = get_lsps()
    },
    enabled = function() -- Disable mason if using MSYS2 env.
      return vim.env.MSYSTEM == nil
    end,
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
  }
}

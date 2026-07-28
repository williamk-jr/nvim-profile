local get_packages = function()
  local language_servers = require("settings.mason.language_servers")
  local keys = {}

  -- Load language servers
  for key, _ in pairs(language_servers) do
    table.insert(keys, key)
  end

  return keys
end

return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      automatic_enable = true,
      ensure_installed = get_packages()
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

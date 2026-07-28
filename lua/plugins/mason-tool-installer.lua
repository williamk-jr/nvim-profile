local get_packages = function()
  local formatters = require("settings.mason.formatters")
  local keys = {}

  -- Load formatters
  for _, formatter in ipairs(formatters) do
    table.insert(keys, formatter)
  end
  return keys
end

return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = get_packages()
  }
}

local formatter_settings = require("settings.format.configs")

return {
  "stevearc/conform.nvim",
  opts = {
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback"
    },
    formatters_by_ft = formatter_settings.formatter_file_type,
    formatters = formatter_settings.settings
  }
}

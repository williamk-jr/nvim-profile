return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    opts = {
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      completion = {
        menu = {
          draw = {
          }
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 250
        },
      }
    }
  }
}

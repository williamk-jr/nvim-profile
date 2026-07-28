return {
	{
		"https://github.com/neovim/nvim-lspconfig",
    opts = {
      servers = require("settings.mason.language_servers")
    },
    config = function (_, opts)
      for server, config in pairs(opts.servers) do
        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end
    end

	}
}

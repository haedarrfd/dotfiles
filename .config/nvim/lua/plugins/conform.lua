return {
	"stevearc/conform.nvim",
	enabled = true,
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format File",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "gofumpt", "goimports-reviser", "golines" },
			rust = { "rustfmt" },
			html = { "prettier" },
			css = { "prettier" },
			scss = { "prettier" },
			json = { "prettier" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			vue = { "prettier" },
			jsx = { "prettier" },
			python = { "isort", "black", stop_after_first = true },
			php = { "pretty-php" },
			blade = { "blade-formatter" },
			markdown = { "prettier" },
			yaml = { "prettier" },
			graphql = { "prettier" },
		},
		formatters = {
			inherit = false,
		},
	},
}

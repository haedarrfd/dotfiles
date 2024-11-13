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
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "gofumpt" },
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
		},
		formatters = {
			inherit = false,
		},
	},
}

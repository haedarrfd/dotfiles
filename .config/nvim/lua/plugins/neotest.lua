return {
	"nvim-neotest/neotest",
	enabled = true,
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"marilari88/neotest-vitest",
		"olimorris/neotest-phpunit",
		"nvim-neotest/neotest-python",
		{
			"fredrikaverpil/neotest-golang",
			version = "*",
			dependencies = {
				"leoluz/nvim-dap-go",
			},
		},
	},
	config = function()
		local neotest = require("neotest")

		neotest.setup({
			adapters = {
				require("neotest-golang")({
					dap_go_enabled = true,
				}),
				require("neotest-vitest"),
				require("neotest-phpunit"),
				require("neotest-python")({
					runner = "pytest",
					python = ".venv/bin/python",
				}),
			},
		})

		vim.keymap.set("n", "<leader>tm", function()
			neotest.run.run()
		end, { desc = "Test Method" })
		vim.keymap.set("n", "<leader>tf", function()
			neotest.run.run(vim.fn.expand("%"))
		end, { desc = "Test File" })
		vim.keymap.set("n", "<leader>ts", function()
			neotest.run.run({ suite = true })
		end, { desc = "Test All" })
	end,
}

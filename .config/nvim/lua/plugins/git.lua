return {
	{
		"tpope/vim-fugitive",
		enabled = true,
	},
	{
		"lewis6991/gitsigns.nvim",
		enabled = true,
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
			})

			vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", { silent = true, desc = "Git Preview" })
			vim.keymap.set(
				"n",
				"<leader>gg",
				"<cmd>Gitsigns toggle_current_line_blame<cr>",
				{ silent = true, desc = "Git Blame" }
			)
			vim.keymap.set("n", "<leader>ge", "<cmd>Gitsigns setqflist<cr>", { silent = true, desc = "Git setqflist" })
			vim.keymap.set(
				"n",
				"<leader>gl",
				"<cmd>Gitsigns setloclist<cr>",
				{ silent = true, desc = "Git setloclist" }
			)
		end,
	},
}

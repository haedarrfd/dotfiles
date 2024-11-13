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

			vim.keymap.set("n", "<leader>gp", "<cmd>:Gitsigns preview_hunk<CR>", { silent = true, desc = "Git preview" })
			vim.keymap.set("n", "<leader>gg", "<cmd>:Gitsigns toggle_current_line_blame<CR>", { silent = true, desc = "Git blame" })
			vim.keymap.set("n", "<leader>ge", "<cmd>:Gitsigns setqflist<CR>", { silent = true, desc = "Set quick fix list" })
			vim.keymap.set("n", "<leader>gl", "<cmd>:Gitsigns setloclist<CR>", { silent = true, desc = "Set location list" })
		end,
	},
}

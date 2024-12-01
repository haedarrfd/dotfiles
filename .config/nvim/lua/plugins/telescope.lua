return {
	{
		"nvim-telescope/telescope.nvim",
		enabled = true,
		event = "VimEnter",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-tree/nvim-web-devicons",
				enabled = vim.g.have_nerd_font,
			},
		},
		config = function()
			vim.keymap.set(
				"n",
				"<leader>sf",
				"<cmd>Telescope find_files hidden=true<cr>",
				{ silent = true, desc = "Search Files" }
			)
			vim.keymap.set(
				"n",
				"<leader>sw",
				"<cmd>Telescope grep_string<cr>",
				{ silent = true, desc = "Search Current Word" }
			)
			vim.keymap.set(
				"n",
				"<leader>sg",
				"<cmd>Telescope live_grep<cr>",
				{ silent = true, desc = "Search by Grep" }
			)
			vim.keymap.set(
				"n",
				"<leader>sd",
				"<cmd>Telescope diagnostics<cr>",
				{ silent = true, desc = "Search Diagnostics" }
			)
			vim.keymap.set(
				"n",
				"<leader><leader>",
				"<cmd>Telescope buffers<cr>",
				{ silent = true, desc = "Search Buffers" }
			)
			vim.keymap.set("n", "<leader>ht", "<cmd>Telescope help_tags<cr>", { silent = true, desc = "Help Tags" })
			vim.keymap.set("n", "<leader>/", function()
				require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					previewer = false,
				}))
			end, { desc = "Fuzzy Search Current Buffer", silent = true })

			require("telescope").load_extension("fzf")
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		enabled = true,
		build = "make",
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		enabled = true,
		config = function()
			require("telescope").setup({
				defaults = {
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--hidden",
					},
					file_ignore_patterns = {
						"node_modules",
						".git",
						"dist",
						"vendor",
						"build",
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}

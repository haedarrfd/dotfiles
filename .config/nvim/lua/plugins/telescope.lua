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
			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<leader>sf", builtin.find_files, { silent = true, desc = "[S]earch [F]iles" })
			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { silent = true, desc = "[S]earch current [W]ord" })
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { silent = true, desc = "[S]earch by [G]rep" })
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { silent = true, desc = "[S]earch [D]iagnostics" })
			vim.keymap.set("n", "<leader>sr", builtin.resume, { silent = true, desc = "[S]earch [R]esume" })
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { silent = true, desc = "[ ] Find existing buffers" })
			vim.keymap.set("n", "<leader>vh", builtin.help_tags, { silent = true, desc = "Help tags" })

			vim.keymap.set("n", "<leader>/", function()
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 15,
					previewer = false,
				}))
			end, { silent = true, desc = "[/] Fuzzily search in current buffer" })

			-- Shortcut for searching your Neovim configuration files
			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { silent = true, desc = "[S]earch [N]eovim files" })

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

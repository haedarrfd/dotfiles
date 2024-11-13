return {
	"folke/trouble.nvim",
	enabled = true,
	opts = {
		max_items = 100,
		icons = {
			indent = {
				middle = " ",
				last = " ",
				top = " ",
				ws = "│  ",
			},
		},
		modes = {
			diagnostics = {
				groups = {
					{ "filename", format = "{file_icon} {basename:Title} {count}" },
				},
			},
		},
	},
	cmd = "Trouble",
	keys = {
		{
			"<leader>tt",
			"<cmd>Trouble diagnostics toggle<cr>",
			silent = true,
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>tp",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			silent = true,
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>ts",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			silent = true,
			desc = "Symbols (Trouble)",
		},
	},
}

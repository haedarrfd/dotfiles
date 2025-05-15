return {
	{
		"goolord/alpha-nvim",
		enabled = true,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.startify")

			dashboard.section.header.val = {
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                     ]],
				[[       ████ ██████           █████      ██                     ]],
				[[      ███████████             █████                             ]],
				[[      █████████ ███████████████████ ███   ███████████   ]],
				[[     █████████  ███    █████████████ █████ ██████████████   ]],
				[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
				[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
				[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                       ]],
			}

			alpha.setup(dashboard.opts)
		end,
	},
	{
		"windwp/nvim-autopairs",
		enabled = true,
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({
				check_ts = true,
				ts_config = {
					lua = { "string" },
					javascript = { "template_string" },
					java = false,
				},
			})

			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")

			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	{
		"numToStr/Comment.nvim",
		enabled = true,
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"ThePrimeagen/harpoon",
		enabled = true,
		branch = "harpoon2",
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup()

			vim.keymap.set("n", "<C-e>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { desc = "Toggle Harpoon" })
			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():add()
			end, { silent = true, desc = "Mark File" })
			vim.keymap.set("n", "<leader>dm", function()
				harpoon:list():remove()
			end, { silent = true, desc = "Delete Mark" })
			vim.keymap.set("n", "<C-a>", function()
				harpoon:list():select(1)
			end, { desc = "Select First Mark" })
			vim.keymap.set("n", "<C-t>", function()
				harpoon:list():select(2)
			end, { desc = "Select Second Mark" })
			vim.keymap.set("n", "<C-x>", function()
				harpoon:list():select(3)
			end, { desc = "Select Third Mark" })
			vim.keymap.set("n", "<C-y>", function()
				harpoon:list():select(4)
			end, { desc = "Select Forth Mark" })
			vim.keymap.set("n", "<C-p>", function()
				harpoon:list():prev()
			end, { desc = "Select Previous Mark" })
			vim.keymap.set("n", "<C-n>", function()
				harpoon:list():next()
			end, { desc = "Select Next Mark" })
		end,
	},
	{
		"echasnovski/mini.nvim",
		enabled = true,
		version = false,
		config = function()
			require("mini.bracketed").setup()
			require("mini.move").setup()
			require("mini.surround").setup()
			require("mini.tabline").setup({
				show_icons = true,
			})
		end,
	},
	{
		"stevearc/oil.nvim",
		enabled = true,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				default_file_explorer = false,
			})

			vim.keymap.set("n", "<C-b>", "<CMD>Oil --float<CR>", { silent = true, desc = "Open oil" })
		end,
	},
	{
		"tpope/vim-sleuth",
		enabled = true,
	},
	{
		"xiyaowong/transparent.nvim",
		enabled = true,
		lazy = false,
	},
	{
		"christoomey/vim-tmux-navigator",
		enabled = true,
		lazy = false,
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
		},
		keys = {
			{ "<C-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<C-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<C-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<C-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
		},
	},
	{
		"ThePrimeagen/vim-be-good",
		enabled = true,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"mbbill/undotree",
		enabled = true,
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undo Tree" })
		end,
	},
	{
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
				desc = "Diagnostics",
			},
			{
				"<leader>tp",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				silent = true,
				desc = "Current Buffer Diagnostics",
			},
			{
				"<leader>ts",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				silent = true,
				desc = "Symbols",
			},
		},
	},
	{
		"akinsho/toggleterm.nvim",
		enabled = true,
		version = "*",
		opts = {},
		keys = {
			{ "<leader>`", "<cmd>ToggleTerm direction=vertical size=50<cr>" },
		},
	},
	{
		"mfussenegger/nvim-jdtls",
		enabled = true,
		dependencies = "hrsh7th/cmp-nvim-lsp",
	},
	{
		"vigoux/notifier.nvim",
		enabled = true,
		config = function()
			require("notifier").setup({})
		end,
	},
}

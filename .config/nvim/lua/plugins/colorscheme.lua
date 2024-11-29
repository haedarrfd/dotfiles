return {
	{
		"zaldih/themery.nvim",
		enabled = true,
		lazy = false,
		config = function()
			require("themery").setup({
				themes = { "kanagawa", "lackluster-hack", "hybrid", "bamboo" },
				livePreview = true,
			})
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		enabled = true,
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				commentStyle = { italic = false },
				keywordStyle = { italic = false },
				statementStyle = { bold = false },
				transparent = true,
				terminalColors = true,
				theme = "dragon",
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none",
							},
						},
					},
				},
				overrides = function(colors)
					local theme = colors.theme

					return {
						NormalFloat = { bg = "#1F1F28" },
						FloatBorder = { bg = "none" },
						FloatTitle = { bg = "none" },
						NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
						LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
						MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
						Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1, blend = vim.o.pumblend },
						PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
						PmenuSbar = { bg = theme.ui.bg_m1 },
						PmenuThumb = { bg = theme.ui.bg_p2 },
						TelescopePromptNormal = { bg = theme.ui.bg_m3 },
						TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
						TelescopePreviewNormal = { bg = theme.ui.bg_dim },
					}
				end,
			})

			vim.cmd("colorscheme kanagawa")
		end,
	},
	{
		"slugbyte/lackluster.nvim",
		enabled = true,
		lazy = false,
		priority = 1000,
		init = function()
			require("lackluster").setup({
				tweak_ui = {
					enable_end_of_buffer = true,
				},
			})

			vim.cmd.colorscheme("lackluster-hack")
		end,
	},
	{
		"HoNamDuong/hybrid.nvim",
		enabled = true,
		lazy = false,
		priority = 1000,
		config = function()
			require("hybrid").setup({
				terminal_colors = true,
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = false,
					emphasis = false,
					comments = false,
					folds = false,
				},
				strikethrough = true,
				inverse = true,
				transparent = false,
			})

			vim.cmd.colorscheme("hybrid")
		end,
	},
	{
		"ribru17/bamboo.nvim",
		enabled = true,
		lazy = false,
		priority = 1000,
		config = function()
			require("bamboo").setup({
				style = "vulgaris",
				transparent = false,
				term_colors = false,
				code_style = {
					comments = { italic = false },
					conditionals = { italic = false },
					namespaces = { italic = false },
					parameters = { italic = false },
				},
			})
			require("bamboo").load()
		end,
	},
}

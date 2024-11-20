return {
	{
		"ellisonleao/gruvbox.nvim",
		enabled = false,
		priority = 1000,
		name = "gruvbox",
		config = function()
			require("gruvbox").setup({
				terminal_colors = true,
				undercurl = true,
				underline = false,
				bold = false,
				italic = {
					strings = false,
					emphasis = false,
					comments = false,
					operators = false,
					folds = false,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true,
				contrast = "",
				palette_overrides = {
					bright_green = "#7788AA",
					bright_red = "#eb6f92",
					bright_orange = "#f6c177",
					-- bright_aqua = "#708090",
					bright_purple = "#ebbcba",
				},
				overrides = {
					["@string"] = { fg = "#708090" },
				},
				dim_inactive = false,
				transparent_mode = false,
			})

			vim.cmd("colorscheme gruvbox")
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
						NormalFloat = { bg = "none" },
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
				theme = "dragon",
			})

			vim.cmd("colorscheme kanagawa")
		end,
	},
}

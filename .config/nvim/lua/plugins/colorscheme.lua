-- function Color()
-- 	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- 	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- end

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
				contrast = "soft",
				palette_overrides = {
					bright_green = "#7788AA",
					bright_red = "#eb6f92",
					bright_orange = "#f6c177",
					bright_aqua = "#708090",
					bright_purple = "#ebbcba",
				},
				overrides = {
					["@string"] = { fg = "#708090" },
				},
				dim_inactive = false,
				transparent_mode = true,
			})

			vim.cmd("colorscheme gruvbox")
			--	Color()
		end,
	},
	{
		"slugbyte/lackluster.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		name = "lackluster",
		init = function()
			local lackluster = require("lackluster")
			lackluster.setup({
				tweak_syntax = {
					string = "default",
					string_escape = "#9ccfd8",
					comment = lackluster.color.gray5,
					builtin = lackluster.color.luster,
					type = lackluster.color.orange,
					keyword = "#eb6f92",
					keyword_return = "#eb6f92",
					keyword_exception = lackluster.color.green,
				},
			})

			vim.cmd("colorscheme lackluster")
			--Color()
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
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none",
							},
						},
					},
				},
			})

			vim.cmd("colorscheme kanagawa-dragon")
			-- Color()
		end,
	},
}

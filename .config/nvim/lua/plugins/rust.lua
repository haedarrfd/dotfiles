return {
	{
		"mrcjkb/rustaceanvim",
		enabled = true,
		version = "^5",
		lazy = false,
	},
	{
		"saecki/crates.nvim",
		enabled = true,
		event = { "BufRead Cargo.toml" },
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("crates").setup({
				completion = {
					cmp = {
						enabled = true,
					},
				},
				lsp = {
					enabled = true,
					actions = true,
					completion = true,
					hover = true,
				},
			})

			require("cmp").setup.buffer({
				sources = { { name = "crates" } },
			})
		end,
	},
}

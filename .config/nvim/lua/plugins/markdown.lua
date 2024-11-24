return {
	{
		"iamcco/markdown-preview.nvim",
		enabled = true,
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
		keys = {
			{
				"<leader>mp",
				"<cmd>MarkdownPreview<cr>",
			},
		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		enabled = true,
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		opts = {
			code = {
				sign = false,
				width = "block",
				right_pad = 1,
			},
			heading = {
				sign = false,
				icons = {},
			},
		},
		config = function()
			vim.keymap.set("n", "<leader>mm", function()
				require("render-markdown").toggle()
			end)
		end,
	},
}

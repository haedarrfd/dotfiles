return {
	"stevearc/oil.nvim",
	enabled = true,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			default_file_explorer = false,
			cleanup_delay_ms = 5000,
		})
		vim.keymap.set("n", "<leader>b", "<CMD>Oil<CR>", { silent = true, desc = "Open parent directory" })
	end,
}

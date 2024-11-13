return {
	"ThePrimeagen/harpoon",
	enabled = true,
	branch = "harpoon2",
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Open harpoon" })
		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, { silent = true, desc = "Mark to harpoon" })
		vim.keymap.set("n", "<leader>dam", function()
			harpoon:list():remove()
		end, { silent = true, desc = "Delete all mark" })
		vim.keymap.set("n", "<C-a>", function()
			harpoon:list():select(1)
		end, { desc = "Select first mark file" })
		vim.keymap.set("n", "<C-t>", function()
			harpoon:list():select(2)
		end, { desc = "Select second mark file" })
		vim.keymap.set("n", "<C-x>", function()
			harpoon:list():select(3)
		end, { desc = "Select third mark file" })
		vim.keymap.set("n", "<C-y>", function()
			harpoon:list():select(4)
		end, { desc = "Select third mark file" })
		vim.keymap.set("n", "<C-p>", function()
			harpoon:list():prev()
		end, { desc = "Select previous mark file" })
		vim.keymap.set("n", "<C-n>", function()
			harpoon:list():next()
		end, { desc = "Select next mark file" })
	end,
}

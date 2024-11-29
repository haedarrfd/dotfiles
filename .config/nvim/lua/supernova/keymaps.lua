-- Clear highlights on search in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear Highlight" })

-- Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<cr>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<cr>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<cr>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<cr>')

-- Move cursor and screen stay in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Remap for join lines
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join Lines" })

-- Navigate search results and the view stay in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Delete a character without copying into register
vim.keymap.set("n", "x", '"_x', { silent = true })

-- Yank to the system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { silent = true })
vim.keymap.set("n", "<leader>Y", [["+Y]], { silent = true })

-- Delete without saving it to the clipboard
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { silent = true })

-- No operation or unmap a keybinding
vim.keymap.set("n", "Q", "<nop>", { desc = "No Operation" })

-- search-and-replace shortcut of the word under the cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Unload the current buffer
vim.keymap.set("n", "<leader>bd", "<cmd>:bd<cr>", { silent = true, desc = "Delete Buffer" })

-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Clear highlights on search in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear highlight" })

-- Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Move a selected block of text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move text below" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move text above" })

-- Move cursor and screen stay in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Remap for join lines
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines" })

-- Navigate search results and the view stay in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Delete a character without copying into register
vim.keymap.set("n", "x", '"_x', { silent = true, desc = "Delete without store in register" })

-- Yank to the system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { silent = true, desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { silent = true, desc = "Yank to system clipboard" })

-- Delete without saving it to the clipboard
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { silent = true, desc = "Delete without store in register" })

-- No operation or unmap a keybinding
vim.keymap.set("n", "Q", "<nop>", { desc = "No operation" })

-- search-and-replace shortcut of the word under the cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Unload the current buffer
vim.keymap.set("n", "<leader>bd", "<cmd>:bd<CR>", { silent = true, desc = "Buffer delete" })

-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

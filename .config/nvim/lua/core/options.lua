vim.opt.number = true
vim.opt.relativenumber = true

-- Highlight search and incremental search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Tab indentaion
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Recovery, backup, and undo stuff
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"

-- Break indent and search patterns
vim.opt.breakindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true

vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 10

vim.opt.updatetime = 100

vim.opt.showmode = true -- Show mode (e.g --NORMAL--)

-- Treat @ characters as valid in file names and path
vim.opt.isfname:append("@-@")

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

vim.opt.cursorline = true -- Show which line your cursor is on

vim.opt.wrap = false -- Line wrap

vim.opt.mouse = "a"

vim.opt.termguicolors = true -- True color support
vim.opt.winblend = 0
vim.opt.pumblend = 0

--Blink cursor
vim.opt.guicursor = table.concat({
	"n-v-c:block-Cursor/lCursor-blinkwait1000-blinkon125-blinkoff75",
	"i-ci:block-Cursor/lCursor-blinkwait1000-blinkon125-blinkoff75",
	"r:hor50-Cursor/lCursor-blinkwait1000-blinkon125-blinkoff75",
}, ",")

local function statusline()
	local file_name = " %F"
	local modified = "%m"
	local align_right = "%="
	local fileencoding = " %{&fileencoding?&fileencoding:&encoding}"
	local fileformat = " [%{&fileformat}]"
	local filetype = " %y"
	local percentage = " %p%%"
	local linecol = " %l:%c"

	return string.format(
		"%s %s%s%s%s%s%s%s",
		file_name,
		modified,
		align_right,
		filetype,
		fileencoding,
		fileformat,
		percentage,
		linecol
	)
end

-- Show fullpath in statusline
vim.opt.laststatus = 2
vim.opt.statusline = statusline()

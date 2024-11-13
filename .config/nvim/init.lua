vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 25

vim.g.markdown_fenced_languages = {
	"ts=typescript",
}

require("config.lazy")
require("options")

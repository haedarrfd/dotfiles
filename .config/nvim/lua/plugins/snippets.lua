return {
	"L3MON4D3/LuaSnip",
	enabled = true,
	version = "v2.*",
	run = "make install_jsregexp",
	dependencies = { "rafamadriz/friendly-snippets" },
	config = function()
		local ls = require("luasnip")
		ls.filetype_extend("javascript", { "jsdoc" })
	end,
}

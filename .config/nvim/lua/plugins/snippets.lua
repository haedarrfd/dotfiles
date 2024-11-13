return {
	"L3MON4D3/LuaSnip",
	enabled = true,
	version = "v2.*",
	run = "make install_jsregexp",
	dependencies = { "rafamadriz/friendly-snippets" },
	config = function()
		local ls = require("luasnip")
		ls.filetype_extend("javascript", { "jsdoc" })

		vim.keymap.set({ "i", "s" }, "<C-e>", function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end, { silent = true })
	end,
}

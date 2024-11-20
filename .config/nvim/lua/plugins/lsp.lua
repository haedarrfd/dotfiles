return {
	"neovim/nvim-lspconfig",
	enabled = true,
	lazy = false,
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
		"j-hui/fidget.nvim",
		"b0o/SchemaStore.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		local capabilities = vim.tbl_deep_extend(
			"force",
			require("lspconfig").util.default_config.capabilities,
			require("cmp_nvim_lsp").default_capabilities()
		)

		-- If you want to load vscode snippet from plugins (friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		require("fidget").setup()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"gopls",
				"cssls",
				"html",
				"denols",
				"pyright",
				"tailwindcss",
				"intelephense",
				"vuels",
				"jsonls",
				"hydra_lsp",
				"marksman",
			},
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,

				lua_ls = function()
					require("lspconfig").lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					})
				end,

				gopls = function()
					require("lspconfig").gopls.setup({
						settings = {
							gopls = {
								gofumpt = true,
								usePlaceholders = true,
								completeUnimported = true,
								codelenses = {
									gc_details = false,
									generate = true,
									regenerate_cgo = true,
									test = true,
									tidy = true,
									upgrade_dependency = true,
									vendor = true,
								},
								hints = {
									assignVariableTypes = true,
									compositeLiteralFields = true,
									compositeLiteralTypes = true,
									constantValues = true,
									functionTypeParameters = true,
									parameterNames = true,
									rangeVariableTypes = true,
								},
								analyses = {
									unusedparams = true,
									nilness = true,
									unusedwrite = true,
									useany = true,
								},
							},
						},
					})
				end,

				cssls = function()
					capabilities.textDocument.completion.completionItem.snippetSupport = true
					require("lspconfig").cssls.setup({
						capabilities = capabilities,
					})
				end,

				html = function()
					capabilities.textDocument.completion.completionItem.snippetSupport = true
					require("lspconfig").html.setup({
						capabilities = capabilities,
					})
				end,

				jsonls = function()
					capabilities.textDocument.completion.completionItem.snippetSupport = true
					require("lspconfig").jsonls.setup({
						capabilities = capabilities,
						settings = {
							json = {
								schemas = require("schemastore").json.schemas(),
								validate = { enable = true },
							},
						},
					})
				end,

				rust_analyzer = function()
					return true
				end,
			},
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(event)
				local opts = { buffer = event.buf, remap = false }

				vim.keymap.set("n", "K", function()
					vim.lsp.buf.hover()
				end, vim.tbl_deep_extend("force", opts, { desc = "LSP hover" }))
				vim.keymap.set("n", "gd", function()
					vim.lsp.buf.definition()
				end, vim.tbl_deep_extend("force", opts, { desc = "Goto definition" }))
				vim.keymap.set("n", "gr", function()
					require("telescope.builtin").lsp_references()
				end, vim.tbl_deep_extend("force", opts, { desc = "LSP references" }))
				vim.keymap.set("n", "go", function()
					vim.lsp.buf.type_definition()
				end, vim.tbl_deep_extend("force", opts, { desc = "LSP type definition" }))
				vim.keymap.set("n", "<leader>ws", function()
					require("telescope.builtin").lsp_dynamic_workspace_symbols()
				end, vim.tbl_deep_extend("force", opts, { desc = "LSP dynamic workspace symbols" }))
				vim.keymap.set("n", "<leader>ca", function()
					vim.lsp.buf.code_action()
				end, vim.tbl_deep_extend("force", opts, { desc = "LSP code action" }))
				vim.keymap.set("i", "<C-h>", function()
					vim.lsp.buf.signature_help()
				end, vim.tbl_deep_extend("force", opts, { desc = "LSP signature help" }))
				--	If you don't use formatter plugin, use the default instead
				--	vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, opts)
				vim.keymap.set("n", "[d", function()
					vim.diagnostic.goto_next()
				end, vim.tbl_deep_extend("force", opts, { desc = "Next diagnostics" }))
				vim.keymap.set("n", "]d", function()
					vim.diagnostic.goto_prev()
				end, vim.tbl_deep_extend("force", opts, { desc = "Previous diagnostics" }))
				vim.keymap.set("n", "<leader>vd", function()
					vim.diagnostic.open_float()
				end, vim.tbl_deep_extend("force", opts, { desc = "Open float diagnostics" }))
			end,
		})

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip", keyword_length = 1 },
				{ name = "buffer", keyword_length = 2 },
				{ name = "path" },
			}),
		})

		vim.diagnostic.config({
			virtual_text = { source = true },
			severity_sort = true,
			update_in_insert = false,
			underline = false,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "E",
					[vim.diagnostic.severity.WARN] = "W",
					[vim.diagnostic.severity.HINT] = "H",
					[vim.diagnostic.severity.INFO] = "I",
				},
			},
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
	end,
}

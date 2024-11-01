return {
	{
		"luckasRanarison/tailwind-tools.nvim",
		name = "tailwind-tools",
		build = ":UpdateRemotePlugins",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-telescope/telescope.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},

	-- Completion
	{
		"hrsh7th/nvim-cmp",
		version = false,
		event = "InsertEnter",
		dependencies = {
			"onsails/lspkind.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lua",

			-- Snippets
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",
				build = "make install_jsregexp",
			},
			{ "rafamadriz/friendly-snippets" },
			"saadparwaiz1/cmp_luasnip",

			-- Copilot
			-- {
			-- 	"zbirenbaum/copilot-cmp",
			-- 	dependencies = {
			-- 		"zbirenbaum/copilot.lua",
			-- 	},
			-- 	config = function()
			-- 		require("copilot_cmp").setup()
			-- 	end
			-- },
		},
		opts = function(_)
			local cmp = require("cmp")
			local lspkind = require("lspkind")

			local defaults = require("cmp.config.default")()

			-- this is the function that loads the extra snippets
			-- from rafamadriz/friendly-snippets
			require("luasnip.loaders.from_vscode").lazy_load()

			return {
				sources = cmp.config.sources({
					-- { name = "copilot", group_index = 2 },
					{ name = "path" },
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				-- experimental = {
				-- 	ghost_text = true,
				-- },
				mapping = cmp.mapping.preset.insert({
					-- confirm completion item
					["<CR>"] = cmp.mapping.confirm({ select = true }),

					-- trigger completion menu
					["<C-Space>"] = cmp.mapping.complete(),

					-- scroll up and down the documentation window
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
				}),
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = lspkind.cmp_format({
						mode = "symbol", -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
						maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
						menu = { -- showing type in menu
							nvim_lsp = "[LSP]",
							path = "[Path]",
							buffer = "[Buf]",
							luasnip = "[Snip]",
						},
						symbol_map = {
							Text = "",
							Method = "",
							Function = "",
							Constructor = "",
							Field = "ﰠ",
							Variable = "",
							Class = "ﴯ",
							Interface = "",
							Module = "",
							Property = "ﰠ",
							Unit = "塞",
							Value = "",
							Enum = "",
							Keyword = "",
							Snippet = "",
							Color = "",
							File = "",
							Reference = "",
							Folder = "",
							EnumMember = "",
							Constant = "",
							Struct = "פּ",
							Event = "",
							Operator = "",
							Copilot = "",
							TailwindTools = "󱏿",
						},
						before = require("tailwind-tools.cmp").lspkind_format,
					}),
				},
				sorting = defaults.sorting,
			}
		end,
	},
}

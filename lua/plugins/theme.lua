return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		build = ":CatppuccinCompile",
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				transparent_background = true,
				integrations = {
					cmp = true,
					dashboard = false,
					fidget = true,
					gitgutter = true,
					gitsigns = true,
					harpoon = true,
					illuminate = true,
					markdown = true,
					mason = true,
					mini = true,
					telescope = { enabled = true },
					treesitter = true,
					treesitter_context = true,
					which_key = true,
					indent_blankline = {
						enabled = true,
						colored_indent_levels = false,
					},
					lsp_trouble = true,
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = { "italic" },
							hints = { "italic" },
							warnings = { "italic" },
							information = { "italic" },
							ok = { "italic" },
						},
						underlines = {
							errors = { "undercurl" },
							hints = { "undercurl" },
							warnings = { "undercurl" },
							information = { "undercurl" },
							ok = { "undercurl" },
						},
						inlay_hints = {
							background = true,
						},
					},
					neotree = true,
					notify = true,
					noice = true,
				},
				custom_highlights = function(colors)
					return {
						-- Ensure that the background is transparent
						Normal = { bg = "none" },
						NormalFloat = { bg = colors.mantle },
						FloatBorder = { fg = colors.crust },

						-- Needed this for undercurls to work
						DiagnosticUnderlineError = { sp = colors.red, undercurl = true },
						DiagnosticUnderlineWarn = { sp = colors.yellow, undercurl = true },
						DiagnosticUnderlineInfo = { sp = colors.sky, undercurl = true },
						DiagnosticUnderlineHint = { sp = colors.teal, undercurl = true },

						-- Telescope
						TelescopeBorder = {
							fg = colors.crust,
							bg = colors.crust,
						},
						TelescopeMatching = { fg = colors.blue },
						TelescopeNormal = {
							bg = colors.crust,
						},
						TelescopePromptBorder = {
							fg = colors.surface0,
							bg = colors.surface0,
						},
						TelescopePromptNormal = {
							fg = colors.text,
							bg = colors.surface0,
						},
						TelescopePromptPrefix = {
							fg = colors.flamingo,
							bg = colors.surface0,
						},
						TelescopePreviewTitle = {
							fg = colors.base,
							bg = colors.green,
						},
						TelescopePromptTitle = {
							fg = colors.base,
							bg = colors.red,
						},
						TelescopeResultsTitle = {
							fg = colors.mantle,
							bg = colors.lavender,
						},
						TelescopeSelection = {
							fg = colors.text,
							bg = colors.surface0,
							style = { "bold" },
						},
						TelescopeSelectionCaret = { fg = colors.flamingo },

						-- Neotree
						NeoTreeNormal = {
							bg = colors.crust,
						},
					}
				end,
			})

			vim.cmd.colorscheme("catppuccin")
		end,
		lazy = false,
		priority = 1000,
	},
}

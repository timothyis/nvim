return {
	"nvim-tree/nvim-web-devicons",
	"MunifTanjim/nui.nvim",

	{
		"rcarriga/nvim-notify",
		opts = {
			render = "minimal",
			stages = "static",
			timeout = 3000,
			max_width = function()
				return math.floor(vim.o.columns * 0.35)
			end,
		},
	},

	-- Better UI with Noice
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"rcarriga/nvim-notify",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			views = {
				cmdline_popup = {
					border = {
						style = "none",
						padding = { 1, 3 }
					},
					filter_options = {},
					win_options = {
						winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder"
					}
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				lsp_doc_border = true,

			},
			routes = {
				{
					filter = {
						event = "notify",
						find = "No information available",
					},
					opts = {
						skip = true,
					},
				},
			},
		},
		-- stylua: ignore
		keys = {
			{ "<S-Enter>",   function() require("noice").redirect(vim.fn.getcmdline()) end,                 mode = "c",                 desc = "Redirect Cmdline" },
			{ "<leader>snl", function() require("noice").cmd("last") end,                                   desc = "Noice Last Message" },
			{ "<leader>snh", function() require("noice").cmd("history") end,                                desc = "Noice History" },
			{ "<leader>sna", function() require("noice").cmd("all") end,                                    desc = "Noice All" },
			{ "<c-f>",       function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end,  silent = true,              expr = true,              desc = "Scroll forward",  mode = { "i", "n", "s" } },
			{ "<c-b>",       function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true,              expr = true,              desc = "Scroll backward", mode = { "i", "n", "s" } },
		},
	},

	-- Add indentation guides even on blank lines
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {}
		-- config = function()
		-- 	require("ibl").setup({
		-- 		indent = {
		-- 			char = "│",
		-- 		},
		-- 		scope = {
		-- 			highlight = "IblIndent",
		-- 			show_end = false,
		-- 			show_start = false,
		-- 		},
		-- 	})
		--
		-- 	local hooks = require("ibl.hooks")
		-- 	hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
		-- end,
	},
}

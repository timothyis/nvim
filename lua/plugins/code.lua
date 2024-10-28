-- Code plugins
-- ------------
-- These plugins augment the code experience in NeoVim,
-- including any visual changes and direct code editing.

return {
	-- Automatically detects tabwidth
	"tpope/vim-sleuth",

	-- Comments
	{
		"numToStr/Comment.nvim",
		dependencies = {
			{
				"JoosepAlviste/nvim-ts-context-commentstring",
				lazy = true,
				opts = {
					enable_autocmd = false,
				},
			},
		},
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
		-- keys = {
		--     { "gc", mode = { "n", "v" }, desc = "Toggle Comment" },
		--     { "gb", mode = { "n", "v" }, desc = "Toggle Comment (Blockwise)" },
		-- },
	},

	-- Multi-cursor
	{
		"mg979/vim-visual-multi",
		event = "VeryLazy",
	},

	-- { -- Collection of various small independent plugins/modules
	-- 	"echasnovski/mini.nvim",
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		-- Add/delete/replace surroundings (brackets, quotes, etc.)
	-- 		--
	-- 		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
	-- 		-- - sd'   - [S]urround [D]elete [']quotes
	-- 		-- - sr)'  - [S]urround [R]eplace [)] [']
	-- 		require("mini.surround").setup()
	--
	-- 		-- ... and there is more!
	-- 		--  Check out: https://github.com/echasnovski/mini.nvim
	-- 	end,
	-- },
	{
		"echasnovski/mini.surround",
		recommended = true,
		opts = {
			add = "gsa",
			delete = "gsd",
			find = "gsf",
			find_left = "gsF",
			highlight = "gsh",
			replace = "gsr",
			update_n_lines = "gsn",
		},
	},
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		opts = {
			modes = { insert = true, command = true, terminal = false },
			skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
			skip_ts = { "string" },
			skip_unbalanced = true,
			markdown = true,
		},
	},
	{
		"echasnovski/mini.ai",
		event = "VeryLazy",
		opts = function()
			local ai = require("mini.ai")
			return {
				custom_textobjects = {
					o = ai.gen_spec.treesitter({
						a = { "@block.outer", "@conditional.outer", "@loop.outer" },
						i = { "@block.inner", "@conditional.inner", "@loop.inner" },
					}),
					f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
					c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
					t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
					d = { "%f[%d]%d+" },                                           -- digits
					e = {                                                          -- Word with case
						{
							"%u[%l%d]+%f[^%l%d]",
							"%f[%S][%l%d]+%f[^%l%d]",
							"%f[%P][%l%d]+%f[^%l%d]",
							"^[%l%d]+%f[^%l%d]",
						},
						"^().*()$",
					},
					u = ai.gen_spec.function_call(),            -- u for "Usage"
					U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }), -- without dot in function name
				},
			}
		end,
	},
}

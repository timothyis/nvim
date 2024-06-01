return {
    -- Git UI
    {
        'tpope/vim-fugitive',
        keys = {
            { "<leader>gs", "<cmd>Git<cr>", desc = "Git Status" }
        },
    },

    -- Git signs in the gutter
    {
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
}

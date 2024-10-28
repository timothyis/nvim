return {
	-- Detect tabstop and shiftwidth automatically
	{
		"MagicDuck/grug-far.nvim",
		opts = { headerMaxWidth = 80 },
		cmd = "GrugFar",
		keys = {
			{
				"<leader>sr",
				function()
					local grug = require("grug-far")
					local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")

					grug.open({
						transient = true,
						prefills = {
							filesFilter = ext and ext ~= "" and "*." .. ext or nil,
						},
					})
				end,
				mode = { "n", "v" },
				desc = "Search and replace",
			},
		},
	},

	-- TMux aware navigation of splits
	{
		"christoomey/vim-tmux-navigator",
		lazy = true,
		keys = {
			{ "<C-h>", desc = "Navigate Window Left" },
			{ "<C-j>", desc = "Navigate Window Bottom" },
			{ "<C-k>", desc = "Navigate Window Top" },
			{ "<C-l>", desc = "Navigate Window Right" },
		},
	},
}

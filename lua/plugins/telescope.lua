return {
	-- fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				config = function()
					require("telescope").load_extension("fzf")
				end,
			},
		},
		config = function()
			require("telescope").load_extension("noice")
		end,
		version = false,
		keys = {
			{ "<leader>,",       "<cmd>Telescope buffers show_all_buffers=true<cr>",   desc = "Switch Buffer" },
			{ "<leader>/",       "<cmd>Telescope live_grep<cr>",                       desc = "Find in Files (Grep)" },
			{ "<leader>:",       "<cmd>Telescope command_history<cr>",                 desc = "Command History" },
			{ "<leader><space>", "<cmd>Telescope find_files<cr>",                      desc = "Find Files (root dir)" },
			-- find
			{ "<leader>fb",      "<cmd>Telescope buffers<cr>",                         desc = "Buffers" },
			{ "<leader>ff",      "<cmd>Telescope find_files<cr>",                      desc = "Find Files (root dir)" },
			{ "<leader>fr",      "<cmd>Telescope oldfiles<cr>",                        desc = "Recent" },
			-- git
			{ "<leader>gc",      "<cmd>Telescope git_commits<cr>",                     desc = "Commits" },
			{ "<leader>gs",      "<cmd>Telescope git_status<cr>",                      desc = "Status" },
			{ "<leader>gb",      "<cmd>Telescope git_branches<cr>",                    desc = "Branches" },
			-- search
			{ "<leader>sa",      "<cmd>Telescope autocommands<cr>",                    desc = "Auto Commands" },
			{ "<leader>sb",      "<cmd>Telescope current_buffer_fuzzy_find<cr>",       desc = "Buffer" },
			{ "<leader>sc",      "<cmd>Telescope command_history<cr>",                 desc = "Command History" },
			{ "<leader>sC",      "<cmd>Telescope commands<cr>",                        desc = "Commands" },
			{ "<leader>sd",      "<cmd>Telescope diagnostics<cr>",                     desc = "Diagnostics" },
			{ "<leader>sg",      "<cmd>Telescope live_grep<cr>",                       desc = "Grep (root dir)" },
			{ "<leader>sh",      "<cmd>Telescope help_tags<cr>",                       desc = "Help Pages" },
			{ "<leader>sH",      "<cmd>Telescope highlights<cr>",                      desc = "Search Highlight Groups" },
			{ "<leader>sk",      "<cmd>Telescope keymaps<cr>",                         desc = "Key Maps" },
			{ "<leader>sM",      "<cmd>Telescope man_pages<cr>",                       desc = "Man Pages" },
			{ "<leader>sm",      "<cmd>Telescope marks<cr>",                           desc = "Jump to Mark" },
			{ "<leader>so",      "<cmd>Telescope vim_options<cr>",                     desc = "Options" },
			{ "<leader>sR",      "<cmd>Telescope resume<cr>",                          desc = "Resume" },
			{ "<leader>sw",      "<cmd>Telescope grep_string<cr>",                     desc = "Word (root dir)" },
			-- ui
			{ "<leader>uC",      "<cmd>Telescope colorscheme enable_preview=true<cr>", desc = "Colorscheme with preview" },
			-- LSP
			{ "gd",              "<cmd>Telescope lsp_definitions<cr>",                 desc = "Go to Definitions" },
			{ "gi",              "<cmd>Telescope lsp_implementations<cr>",             desc = "Go to Implementations" },
			{ "gr",              "<cmd>Telescope lsp_references<cr>",                  desc = "LSP References" },
			{ "gS",              "<cmd>Telescope lsp_workspace_symbols<cr>",           desc = "LSP Workspace Symbols" },
			{ "gh",              "<cmd>Telescope lsp_document_diagnostics<cr>",        desc = "LSP Document Diagnostics" },
			{ "gH",              "<cmd>Telescope lsp_workspace_diagnostics<cr>",       desc = "LSP Workspace Diagnostics" },
			{ "gD",              "<cmd>Telescope lsp_type_definitions<cr>",            desc = "Go to Type Definitions" },
			{ "ca",              "<cmd>Telescope lsp_code_actions<cr>",                desc = "LSP Code Actions" },
		},
		opts = function()
			return {
				defaults = {
					prompt_prefix = "   ",
					selection_caret = " ",
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							prompt_position = "top",
							preview_width = 0.55,
						},
						width = 0.87,
						height = 0.80,
					},
					sorting_strategy = "ascending",
				},
				file_ignore_patterns = {
					".git/",
					"node_modules/",
					"vendor/",
					"pnpm-lock.yaml",
				},
			}
		end,
	},
}

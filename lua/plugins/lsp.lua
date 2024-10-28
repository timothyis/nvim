return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v4.x",
		dependencies = {
			-- Mason
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			-- LSP Config
			"neovim/nvim-lspconfig",

			-- TypeScript Better LSP
			{
				"pmizio/typescript-tools.nvim",
				dependencies = {
					"nvim-lua/plenary.nvim",
					"neovim/nvim-lspconfig",
				},
				opts = {},
			},
		},
		config = function()
			local lsp_zero = require("lsp-zero")

			local lsp_attach = function(client, bufnr)
				local opts = { buffer = bufnr }

				vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
				vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
				vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
				vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)

				lsp_zero.highlight_symbol(client, bufnr)
				-- lsp_zero.buffer_autoformat()
			end

			lsp_zero.extend_lspconfig({
				sign_text = true,
				lsp_attach = lsp_attach,
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})

			lsp_zero.ui({
				float_border = "rounded",
				sign_text = {
					error = "✘",
					warn = "▲",
					hint = "⚑",
					info = "»",
				},
			})

			-- lsp_zero.format_on_save({
			-- 	format_opts = {
			-- 		async = false,
			-- 		timeout_ms = 10000,
			-- 	},
			-- 	servers = {
			-- 		["stylua"] = { "lua" },
			-- 		["prettierd"] = { "typescript", "typescriptreact", "html", "css" },
			-- 	},
			-- })

			require("mason").setup()
			require("mason-lspconfig").setup({
				-- Replace the language servers listed here
				-- with the ones you want to install
				ensure_installed = { "tailwindcss", "html", "cssls", "lua_ls", "jsonls" },
				handlers = {
					function(server_name)
						if server_name == "tsserver" then
							return
						end
						require("lspconfig")[server_name].setup({})
					end,
					lua_ls = function()
						local lua_opts = lsp_zero.nvim_lua_ls()
						require("lspconfig").lua_ls.setup(lua_opts)
					end,
				},
			})
		end,
	},

	{ "folke/neodev.nvim", opts = {} },
}

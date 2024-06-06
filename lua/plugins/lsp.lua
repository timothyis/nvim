return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        dependencies = {
            -- Mason
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",

            -- LSP Config
            "neovim/nvim-lspconfig",
        },
        config = function()
            local lsp_zero = require("lsp-zero")

            lsp_zero.on_attach(function(_, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({ buffer = bufnr })
            end)

            lsp_zero.set_sign_icons({
                error = "✘",
                warn = "▲",
                hint = "⚑",
                info = "»",
            })

            require("mason").setup()
            require("mason-lspconfig").setup({
                -- Replace the language servers listed here
                -- with the ones you want to install
                ensure_installed = { "tsserver", "rust_analyzer" },
                handlers = {
                    function(server_name)
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

    -- Completion
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        lazy = false,
        priority = 100,
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
        },
        config = function()
            local lsp_zero = require("lsp-zero")
            local cmp = require("cmp")

            local cmp_action = lsp_zero.cmp_action()

            -- this is the function that loads the extra snippets
            -- from rafamadriz/friendly-snippets
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                sources = {
                    { name = "path" },
                    { name = "nvim_lsp" },
                    { name = "luasnip", keyword_length = 2 },
                    { name = "buffer", keyword_length = 3 },
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    -- confirm completion item
                    ["<Enter>"] = cmp.mapping.confirm({ select = true }),

                    -- trigger completion menu
                    ["<C-Space>"] = cmp.mapping.complete(),

                    -- scroll up and down the documentation window
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),

                    -- navigate between snippet placeholders
                    ["<C-f>"] = cmp_action.luasnip_jump_forward(),
                    ["<C-b>"] = cmp_action.luasnip_jump_backward(),
                }),
                -- note: if you are going to use lsp-kind (another plugin)
                -- replace the line below with the function from lsp-kind
                formatting = lsp_zero.cmp_format({ details = true }),
            })
        end,
    },

    -- TypeScript Better LSP
    {
        "pmizio/typescript-tools.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
        },
        keys = {
            { "<leader>cf", "<cmd>TSToolsFixAll<CR>" },
            { "<leader>ci", "<cmd>TSToolsAddMissingImports<CR>" },
            { "<leader>co", "<cmd>TSToolsOrganizeImports<CR>" },
            { "<leader>rf", "<cmd>TSToolsRenameFile<CR>" },
        },
        opts = {},
    },

    { -- Autoformat
        "stevearc/conform.nvim",
        lazy = false,
        keys = {
            {
                "<leader>f",
                function()
                    require("conform").format({ async = true, lsp_fallback = true })
                end,
                mode = "",
                desc = "[F]ormat buffer",
            },
        },
        opts = {
            notify_on_error = false,
            format_on_save = function(bufnr)
                -- Disable "format_on_save lsp_fallback" for languages that don't
                -- have a well standardized coding style. You can add additional
                -- languages here or re-enable it for the disabled ones.
                local disable_filetypes = { c = true, cpp = true }
                return {
                    timeout_ms = 500,
                    lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
                }
            end,
            formatters_by_ft = {
                lua = { "stylua" },
                typescript = { "prettier" },
                typescriptreact = { "prettier" },
                -- Conform can also run multiple formatters sequentially
                -- python = { "isort", "black" },
                --
                -- You can use a sub-list to tell conform to run *until* a formatter
                -- is found.
                -- javascript = { { "prettierd", "prettier" } },
            },
        },
    },
}

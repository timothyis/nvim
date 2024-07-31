return {
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
            local lspkind = require("lspkind")

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
                -- formatting = lsp_zero.cmp_format({ details = true }),
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = lspkind.cmp_format({
                        mode = "symbol_text", -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
                        maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                        menu = { -- showing type in menu
                            nvim_lsp = "[LSP]",
                            path = "[Path]",
                            buffer = "[Buf]",
                            luasnip = "[Snip]",
                        },
                        before = function(entry, vim_item) -- for tailwind css autocomplete
                            if vim_item.kind == "Color" and entry.completion_item.documentation then
                                local _, _, r, g, b =
                                    string.find(entry.completion_item.documentation, "^rgb%((%d+), (%d+), (%d+)")
                                if r then
                                    local color = string.format("%02x", r)
                                        .. string.format("%02x", g)
                                        .. string.format("%02x", b)
                                    local group = "Tw_" .. color
                                    if vim.fn.hlID(group) < 1 then
                                        vim.api.nvim_set_hl(0, group, { fg = "#" .. color })
                                    end
                                    vim_item.kind = "■" -- or "⬤" or anything
                                    vim_item.kind_hl_group = group
                                    return vim_item
                                end
                            end
                            -- vim_item.kind = icons[vim_item.kind] and (icons[vim_item.kind] .. vim_item.kind) or vim_item.kind
                            -- or just show the icon
                            vim_item.kind = lspkind.symbolic(vim_item.kind) and lspkind.symbolic(vim_item.kind)
                                or vim_item.kind
                            return vim_item
                        end,
                    }),
                },
            })
        end,
    },

    {
        "luckasRanarison/tailwind-tools.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {}, -- your configuration
    },
}

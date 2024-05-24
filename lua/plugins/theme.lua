return {
    {
        "MunifTanjim/nui.nvim"
    },

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
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
            },
        },
        -- stylua: ignore
        keys = {
            { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
            { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
            { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
            { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
            { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll forward", mode = {"i", "n", "s"} },
            { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll backward", mode = {"i", "n", "s"}},
        },
    },

    -- Icons
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true
    },

    {
        "catppuccin/nvim",
        name = "catppuccin",
        build = ":CatppuccinCompile",
        opts = {
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
                telescope = true,
                treesitter = true,
                treesitter_context = true,
                which_key = true,
                indent_blankline = {
                    enabled = true,
                    colored_indent_levels = false,
                },
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { "italic" },
                        hints = { "italic" },
                        warnings = { "italic" },
                        information = { "italic" },
                    },
                    underlines = {
                        errors = { "underline" },
                        hints = { "underline" },
                        warnings = { "underline" },
                        information = { "underline" },
                    },
                },
                neotree = true,
                notify = true,
            },
        },
        lazy = false,
        priority = 1000,
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme catppuccin]])
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end,
    },

     -- Add indentation guides even on blank lines
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = "BufReadPost",
        opts = {
            exclude = {
                filetypes = {
                    "Neotree",
                    "txt",
                    "markdown",
                },
            },
        },
    },
}

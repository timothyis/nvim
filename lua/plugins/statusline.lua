return {
    -- Lualine
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        init = function()
            vim.g.lualine_laststatus = vim.o.laststatus
            if vim.fn.argc(-1) > 0 then
                -- set an empty statusline until lualine loads
                vim.o.statusline = " "
            else
                -- hide the statusline on the starter page
                vim.o.laststatus = 0
            end
        end,
        opts = function()
            vim.o.laststatus = vim.g.lualine_laststatus

            local custom_catppuccin = require("lualine.themes.catppuccin")
            custom_catppuccin.normal.b.bg = "None"
            custom_catppuccin.insert.b.bg = "None"
            custom_catppuccin.terminal.b.bg = "None"
            custom_catppuccin.command.b.bg = "None"
            custom_catppuccin.visual.b.bg = "None"
            custom_catppuccin.replace.b.bg = "None"

            custom_catppuccin.normal.c.bg = "None"

            local opts = {
                options = {
                    theme = custom_catppuccin,
                    component_separators = "|",
                    section_separators = { left = "", right = "" },
                    globalstatus = false,
                    disabled_filetypes = {
                        "ministarter",
                    },
                },
                sections = {
                    lualine_a = {
                        { "mode", right_padding = 2 },
                    },
                    lualine_b = {
                        {
                            "diagnostics",
                            symbols = { error = " ", warn = " ", info = " " },
                        },
                        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
                        {
                            "filename",
                            path = 1,
                        },
                    },
                    lualine_c = {},
                    lualine_x = {
                        {
                            "diff",
                            colored = true, -- Displays a colored diff status if set to true
                            diff_color = {
                                -- Same color values as the general color option can be used here.
                                added = "DiffAdd", -- Changes the diff's added color
                                modified = "DiffChange", -- Changes the diff's modified color
                                removed = "DiffDelete", -- Changes the diff's removed color you
                            },
                            symbols = { added = "+", modified = "~", removed = "-" }, -- Changes the symbols used by the diff.
                        },
                    },
                    lualine_y = {},
                    lualine_z = {},
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {
                        {
                            "filename",
                            path = 1,
                        },
                    },
                    lualine_x = {
                        "location",
                    },
                    lualine_y = {},
                    lualine_z = {},
                },
                statusline = {},
                winbar = {},
                tabline = {},
                extensions = {
                    "fzf",
                    "fugitive",
                    "lazy",
                    "neo-tree",
                    "trouble",
                },
            }
            return opts
        end,
    },
}

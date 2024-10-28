return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        lazy = true,
        cmd = "Neotree",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        opts = {
            close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
            popup_border_style = "rounded",
            enable_git_status = true,
            enable_diagnostics = true,
            source_selector = {
                winbar = true,
            },
            filesystem = {
                follow_current_file = {
                    enabled = true,
                },
                filtered_items = {
                    hide_dotfiles = false,
                    hide_by_name = {
                        "node_modules",
                    },
                    never_show = {
                        ".DS_Store",
                    },
                },
            },
            window = {
                position = "float",
                width = math.floor(vim.o.columns * 0.85),
            },
        },
        keys = {
            { "<leader>e", ":Neotree filesystem reveal float toggle<CR>", silent = true },
            { "<leader>vb", ":Neotree buffers reveal float toggle<CR>", silent = true },
            { "<leader>vg", ":Neotree git_status reveal float toggle<CR>", silent = true },
        },
    },
}

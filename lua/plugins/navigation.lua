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
        version = false, -- telescope did only one release, so use HEAD for now
        keys = {
            { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
            { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Find in Files (Grep)" },
            { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
            { "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Find Files (root dir)" },
            -- find
            { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files (root dir)" },
            { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
            -- git
            { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Commits" },
            { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Status" },
            { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Branches" },
            -- search
            { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
            { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
            { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
            { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
            { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
            { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Grep (root dir)" },
            { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
            { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
            { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
            { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
            { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
            { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
            { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
            { "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "Word (root dir)" },
            -- ui
            { "<leader>uC", "<cmd>Telescope colorscheme enable_preview=true<cr>", desc = "Colorscheme with preview" },
            -- LSP
            { "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Go to Definitions" },
            { "gi", "<cmd>Telescope lsp_implementations<cr>", desc = "Go to Implementations" },
            { "gr", "<cmd>Telescope lsp_references<cr>", desc = "LSP References" },
            { "gs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "LSP Document Symbols" },
            { "gS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "LSP Workspace Symbols" },
            { "gh", "<cmd>Telescope lsp_document_diagnostics<cr>", desc = "LSP Document Diagnostics" },
            { "gH", "<cmd>Telescope lsp_workspace_diagnostics<cr>", desc = "LSP Workspace Diagnostics" },
            { "gD", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Go to Type Definitions" },
            { "ca", "<cmd>Telescope lsp_code_actions<cr>", desc = "LSP Code Actions" },
        },
        config = function()
            require("telescope").setup({
                defaults = {
                    prompt_prefix = " ",
                    selection_caret = " ",
                    layout_strategy = "horizontal",
                    layout_config = { prompt_position = "top" },
                    sorting_strategy = "ascending",
                    winblend = 0,
                },
                file_ignore_patterns = {
                    ".git/",
                    "node_modules/",
                    "vendor/",
                    "pnpm-lock.yaml",
                },
            })
        end,
    },

    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        keys = function()
            local keys = {
                {
                    "<leader>ha",
                    function()
                        require("harpoon"):list():add()
                    end,
                    desc = "(h)arpoon (a)dd file",
                },
                {
                    "<leader>hf",
                    function()
                        local harpoon = require("harpoon")
                        harpoon.ui:toggle_quick_menu(harpoon:list())
                    end,
                },
            }

            for i = 1, 5 do
                table.insert(keys, {
                    "<leader>" .. i,
                    function()
                        require("harpoon"):list():select(i)
                    end,
                    desc = "Harpoon to File " .. i,
                })
            end
            return keys
        end,
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

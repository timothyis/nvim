return {
    -- which-key
    {
        "folke/which-key.nvim",
        event = "VimEnter",
        opts = {
            spec = {
                {
                    mode = { "n", "v" },
                    { "<leader>b", group = "buffer" },
                    { "<leader>c", group = "code" },
                    { "<leader>f", group = "file/find" },
                    { "<leader>g", group = "git" },
                    { "<leader>gh", group = "hunks" },
                    { "<leader>h", group = "harpoon" },
                    { "<leader>pv", group = "projectfiles" },
                    { "<leader>q", group = "quit/session" },
                    { "<leader>s", group = "search" },
                    { "<leader>u", group = "ui" },
                    { "<leader>w", group = "windows" },
                    { "<leader>x", group = "diagnostics/quickfix" },
                    { "[", group = "prev" },
                    { "]", group = "next" },
                    { "g", group = "goto" },
                    { "gz", group = "surround" },
                },
            },
        },
    },
}

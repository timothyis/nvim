
-- Code plugins
-- ------------
-- These plugins augment the code experience in NeoVim,
-- including any visual changes and direct code editing.

return {
    -- Comments
    {
        "numToStr/Comment.nvim",
        dependencies = {
            'JoosepAlviste/nvim-ts-context-commentstring',
        },
        config = function()
            require('Comment').setup({
                pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
            })

            local ft = require('Comment.ft')

            ft.htmldjango = { "{# %s #}", "{% comment %} %s {% endcomment %}" }
        end,
        keys = {
            { "gc", mode = { "n", "v" }, desc = "Toggle Comment" },
            { "gb", mode = { "n", "v" }, desc = "Toggle Comment (Blockwise)" }
        }
    },

    -- Highlight References
    {
        "RRethy/vim-illuminate",
        event = { "BufReadPost", "BufNewFile" },
        opts = { delay = 200 },
        config = function(_, opts)
            require("illuminate").configure(opts)

            local function map(key, dir, buffer)
                vim.keymap.set("n", key, function()
                    require("illuminate")["goto_" .. dir .. "_reference"](false)
                end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
            end

            map("]]", "next")
            map("[[", "prev")

            -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    local buffer = vim.api.nvim_get_current_buf()
                    map("]]", "next", buffer)
                    map("[[", "prev", buffer)
                end,
            })
        end,
        keys = {
            { "]]", desc = "Next Reference" },
            { "[[", desc = "Prev Reference" },
        },
    },

    {
        "mg979/vim-visual-multi",
        keys = {
            { "C-n", desc = "Create multi-cursor with next occurrence" },
            { "C-Down", desc = "Create multi-cursor below" },
            { "C-Up", desc = "Create multi-cursor above" },
        }
    }
}

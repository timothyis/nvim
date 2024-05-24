local function map(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
end

-- Core
-- ----

-- Lazy
map("n", "<leader>l", "<cmd>:Lazy<cr>", { desc = "Lazy" })




-- Code
-- ----
map("n", "[<space>", ":<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[", { desc = "Add x empty lines above", silent = true})
map("n", "]<space>", ":<c-u>put =repeat(nr2char(10), v:count1)<cr>", { desc = "Add x empty lines above", silent = true })




-- Search
-- ------

-- Search for word
map({ "n", "x" }, "sw", "*N", { desc = "Search word under cursor" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })




-- Marks
-- -----

-- Add mark
map('n', '<leader>m', '`', { desc = "[m]ark add", silent = true })




-- Motions
-- -------
-- Move visual selection up or down
map("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
map("v", "J", ":m '>+1<CR>gv=gv", { silent = true })

-- Combine lines without moving cursor
map('n', 'J', 'mzJ`z')

-- Yank line without moving
map('x', 'y', 'myy`y')

-- Move buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })




-- Move
-- ----

-- Page up/down with cursor centred
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

-- Search navigation up/down with cursor centred
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Move visual lines when wrapping
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Reselect visual selection after indenting
map("v", "<", "<gv")
map("v", ">", ">gv")




-- Splits
-- ------

-- Create Splits
map("n", "<leader>w-", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>w|", "<C-W>v", { desc = "Split window right" })
map("n", "<leader>-", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>|", "<C-W>v", { desc = "Split window right" })

-- Delete Split
map("n", "<leader>wd", "<C-W>c", { desc = "Delete split" })




-- Clipboard
-- ---------

-- Paste without overwriting vim clipboard
map("x", "<leader>p", [["_dP]])

-- Yank to system clipboard
map({"n", "v"}, "<leader>y", [["+y]], { desc = "Copy to system clipboard", silent = true })
map("n", "<leader>Y", [["+Y]], { desc = "Copy to system clipboard", silent = true })




-- File
-- ----

-- New file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- Source current file
map("n", "<leader><leader>", function()
    vim.cmd("so")
end)


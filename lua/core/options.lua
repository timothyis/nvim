local opt = vim.opt
local g = vim.g

-- Core
-- ----

opt.spelllang = { 'en_gb' }

-- Set leader
g.mapleader = " "
g.maplocalleader = " "

-- Set update time to a lower amount
opt.updatetime = 250
opt.timeout = true
opt.timeoutlen = 300

-- Global Statusline
opt.laststatus = 3

-- Enable mouse mode just incase, for scrolling only
opt.mouse = "a" -- Enable mouse mode

-- Confirm saving changes when buffer is modified
opt.confirm = true

-- Use ripgrep for grepping
opt.grepprg = "rg --vimgrep"

-- Keep screenline when opening/closing/resizing horizontal splits
opt.splitkeep = "screen"

-- Modify messages (no "written", no intro, no completion, no scanning)
opt.shortmess:append { W = true, I = true, c = true, C = true }

-- Let lualine handle showing the mode
opt.showmode = false

-- Split direction defautls
opt.splitbelow = true
opt.splitright = true

-- Disable providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- Disable menu
vim.g.did_install_default_menus = 1



-- Visual
-- ------

-- Show line numbers
opt.nu = true

-- Use relative line numbers
opt.relativenumber = true

-- All the colours
opt.termguicolors = true

-- Allow scrolling below the last line
opt.scrolloff = 8

-- Column in linenumber sidebar for signs (e.g., git signs)
opt.signcolumn = "yes"

-- Line for cursor in insert mode
opt.cursorline = true

-- List some invisible characters
opt.list = true




-- Project
-- -------

-- Netrw settings
g.netrw_browse_split = 0
g.netrw_banner = 0
g.netrw_winsize = 25




-- Code
-- ----

-- Tab styles
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- Nvim be smart about indenting
opt.smartindent = true

-- Indent when breaking line
opt.breakindent = true
opt.linebreak = true

-- Fix markdown indentation settings
g.markdown_recommended_style = 0

-- Completion options
-- Menuone: show when there's one match
-- Noselect: Do not select a match by default
opt.completeopt = "menuone,noselect"

-- Don't stop backspace at insert
opt.backspace:append { "nostop" }

-- enable linematch diff algorithm
opt.diffopt:append "linematch:60"

opt.pumheight = 10

opt.virtualedit = "block"

g.lsp_handlers_enabled = true

g.cmp_enabled = true

g.autopairs_enabled = true

g.icons_enabled = true




-- Search
-- ------

-- Case insensitive searching UNLESS /C or capital in search
opt.ignorecase = true
opt.smartcase = true

-- Highlight search only when searching
opt.hlsearch = false
opt.incsearch = true




-- History
-- -------

-- No swap files, use a file for undo history
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true


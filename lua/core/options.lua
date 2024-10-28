local opt = vim.opt
local g = vim.g

--
-- Core
-- ----

opt.spelllang = { "en_gb" }

-- Set leader
g.mapleader = " "
g.maplocalleader = " "

-- Set update time to a lower amount
opt.updatetime = 100
opt.timeout = true
opt.timeoutlen = 300

-- Global Statusline
opt.laststatus = 3

-- Enable mouse mode just incase, for scrolling only
opt.mouse = "a" -- Enable mouse mode

-- Confirm saving changes when buffer is modified
opt.confirm = true

-- Modify messages
opt.shortmess:append({
	W = true, -- Don't print "written" when writing a file
	I = true, -- No into on vim start
	c = true, -- No insert completion messages
	C = true, -- No insert scanning messages
	a = true, -- Abbreviate messages
	F = true, -- No file info when editing
	s = true, -- Do not show "Search hit BOTTOM" message
})

-- Let the statusline handle showing the mode
opt.showmode = false

-- Split direction defaults
opt.splitbelow = true
opt.splitright = true

-- Keep screenline when opening/closing/resizing horizontal splits
opt.splitkeep = "screen"

-- Disable providers
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- Disable menu
g.did_install_default_menus = 1

-- Modify how lines are traversed
opt.whichwrap = opt.whichwrap + "h,l,<,>,[,]"

-- Preview substitutions
opt.inccommand = "split"

--
-- UI
-- ------

-- Show line numbers
opt.nu = true

-- Use relative line numbers
opt.relativenumber = true

-- All the colours
opt.termguicolors = true

-- Allow specified keys that move the cursor left/right to move to the
-- previous/next line when the cursor is on the first/last character in
-- the line.
opt.scrolloff = 10
opt.sidescrolloff = 3

-- Column in linenumber sidebar for signs (e.g., git signs)
opt.signcolumn = "yes"

-- Statuscolumn
opt.numberwidth = 3
-- vim.opt.statuscolumn = "%=%{v:virtnum < 1 ? (v:relnum ? v:relnum : v:lnum < 10 ? v:lnum . '  ' : v:lnum) : ''}%=%s"

-- Line for cursor in insert mode
opt.cursorline = true

-- List some invisible characters
opt.list = true
opt.listchars = {
	nbsp = "⦸", -- CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
	tab = "  ",
	extends = "»", -- RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
	precedes = "«", -- LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
	trail = "·", -- Dot Operator (U+22C5)
	-- space = '·',
	-- tab = '  ↦'
}

opt.showbreak = "↳ " -- DOWNWARDS ARROW WITH TIP RIGHTWARDS (U+21B3, UTF-8: E2 86 B3)
opt.fillchars = {
	eob = " ", -- Suppress ~ at EndOfBuffer
	fold = " ", -- Hide trailing folding characters
	diff = "╱",
	foldopen = "",
	foldclose = "",
	foldsep = ' ',
	msgsep = '─',
}

--
-- Project
-- -------

-- Netrw settings
g.netrw_browse_split = 0
g.netrw_banner = 0
g.netrw_winsize = 25

-- File extensions to ignore when opened with gf
opt.suffixesadd = { ".md", ".js", ".ts", ".tsx" }

--
-- Code
-- ----

-- Indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
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
opt.completeopt = { "menuone", "noselect" }

-- Don't stop backspace at insert
opt.backspace:append({ "nostop" })

-- enable linematch diff algorithm
opt.diffopt:append("linematch:60")

opt.pumheight = 13

opt.virtualedit = "block"

g.lsp_handlers_enabled = true

g.cmp_enabled = true

g.autopairs_enabled = true

g.icons_enabled = true

-- Folds
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldtext = ""

--
-- Search
-- ------

-- Case insensitive searching UNLESS /C or capital in search
opt.ignorecase = true
opt.smartcase = true

-- Highlight search only when searching
opt.hlsearch = false
opt.incsearch = true

-- Use ripgrep for grepping
opt.grepprg = "rg --ignore-case --vimgrep"
opt.grepformat = "%f:%l:%c:%m,%f:%l:%m" -- https://neovim.io/doc/user/quickfix.html#errorformat

-- Ignores
opt.wildignore = {
	".DS_Store",
	"**/node_modules/**",
	"**/coverage/**",
	"**/.idea/**",
	"**/.git/**",
	"**/.vscode/**",
	"**/pnpm-lock.yaml",
}

--
-- History
-- -------

-- No swap files, use a file for undo history
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.undolevels = 1000
opt.undoreload = 10000
opt.shada = { "!", "'1000", "<50", "s10", "h" }

-- Backup settings
vim.opt.backup = true
vim.opt.backupdir = os.getenv("HOME") .. "/.vim/backups"
vim.opt.writebackup = true

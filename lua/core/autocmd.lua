local api = vim.api

-- resize splits if window got resized
api.nvim_create_autocmd({ "VimResized" }, {
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

-- Highlight on yank
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
	command = "silent! lua vim.highlight.on_yank()",
	group = yankGrp,
})

-- show cursor line only in active window
local cursorGrp = api.nvim_create_augroup("CursorLine", { clear = true })
api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, { pattern = "*", command = "set cursorline", group = cursorGrp })
api.nvim_create_autocmd(
	{ "InsertEnter", "WinLeave" },
	{ pattern = "*", command = "set nocursorline", group = cursorGrp }
)

local aug = vim.api.nvim_create_augroup("buf_large", { clear = true })

vim.api.nvim_create_autocmd({ "BufReadPre" }, {
	callback = function()
		local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()))
		if ok and stats and (stats.size > 1000000) then
			vim.b.large_buf = true
			vim.cmd("syntax off")
			vim.cmd("IndentBlanklineDisable") -- disable indent-blankline.nvim
			vim.opt_local.foldmethod = "manual"
			vim.opt_local.spell = false
		else
			vim.b.large_buf = false
		end
	end,
	group = aug,
	pattern = "*",
})

-- Allow closing views with q
local qCloseGroup = api.nvim_create_augroup("FileTypeQClose", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = qCloseGroup,
	pattern = {
		"grug-far",
		"help",
		"lsp-info",
		"notify",
		"qf",
		"spectre_panel",
		"checkhealth",
		"gitsigns.blame",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", {
			buffer = event.buf,
			silent = true,
			desc = "Quit buffer",
		})
	end,
})

-- global
local o = vim.o
-- window
local wo = vim.wo
-- buffer local
local bo = vim.bo
-- set global
local g = vim.g

g.mapleader = " "

vim.opt.background = "dark"
vim.opt.termguicolors = true
vim.opt.relativenumber = true -- Show line numbers relative to cursor.
vim.opt.number = true -- Show actual number for the line we are on.
vim.opt.showcmd = false -- Shows previous cmd in bottom right corner.
vim.opt.showmode = true -- Shows current editor mode. (insert, visual, normal)
vim.opt.ignorecase = true -- Ignore case when searching...
vim.opt.smartcase = true -- ...unless there is a capital letter.
vim.opt.hlsearch = true
vim.opt.incsearch = true -- Search acts like seach in modern browsers.
vim.opt.mouse = "a" -- Mouse in all modes.
vim.opt.updatetime = 50 -- Updates happen faster.
vim.opt.scrolloff = 10 -- Always ten lines below cursor.
vim.opt.cmdheight = 1 -- Height of the command bar.
vim.opt.splitbelow = true -- Window panes split to the bottom.
vim.opt.splitright = true -- Window panes split to the right.
vim.opt.cursorline = true -- Highlight cursorline.
vim.opt.showmatch = false -- Don't show matching bracket when inserting.
vim.opt.backup = false
vim.opt.laststatus = 2 -- When will last window have a status line. (2 == Always)
vim.opt.belloff = "all" -- No bells.
-- vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.swapfile = false

vim.opt.clipboard = "unnamedplus"

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- vim.cmd('colorscheme rose-pine')
vim.cmd([[colorscheme tokyonight-night]])
-- vim.cmd([[colorscheme gruvbox]])
-- require'colorbuddy'.colorscheme('simplescheme')
--
--vim.opt.tabstop = 4 -- Number of spaces that a tab in a file accounts for.
--vim.opt.shiftwidth = 4 -- Number of spaces to use for each step of autoindent
--vim.opt.softtabstop = 4
--vim.opt.expandtab = true
--vim.opt.autoindent = false

--bo.smartindent = true
--vim.opt.cindent = true


-- global
local o = vim.o
-- window
local wo = vim.wo
-- buffer local
local bo = vim.bo
-- set global
local g = vim.g

g.mapleader = " "
vim.o.completeopt = "menu,menuone,noselect"
vim.opt.background = "dark"
vim.opt.termguicolors = true
vim.opt.relativenumber = true -- Show line numbers relative to cursor.
vim.opt.number = true -- Show actual number for the line we are on.
vim.opt.showcmd = true -- Shows previous cmd in bottom right corner.
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
vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.swapfile = false

vim.opt.clipboard = "unnamedplus"

vim.cmd([[colorscheme gruvbox]])
-- vim.cmd([[colorscheme onedark]])
-- vim.cmd([[colorscheme codedark]])

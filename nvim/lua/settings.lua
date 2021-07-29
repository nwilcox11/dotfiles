-- global
local o = vim.o
-- window
local wo = vim.wo
-- buffer local
local bo = vim.bo

o.background = "dark"
o.termguicolors = true
o.relativenumber = true -- Show line numbers relative to cursor.
o.number = true -- Show actual number for the line we are on.
o.showcmd = false -- Shows previous cmd in bottom right corner.
o.showmode = false -- Shows current editor mode. (insert, visual, normal)
o.ignorecase = true -- Ignore case when searching...
o.smartcase = true -- ...unless there is a capital letter.
o.hlsearch = true
o.incsearch = true -- Search acts like seach in modern browsers.
o.mouse = "a" -- Mouse in all modes.
o.updatetime = 1000 -- Updates happen faster.
o.scrolloff = 10 -- Always ten lines below cursor.
o.cmdheight = 1 -- Height of the command bar.
o.splitbelow = true -- Window panes split to the bottom.
o.splitright = true -- Window panes split to the right.
o.cursorline = true -- Highlight cursorline.
o.showmatch = false -- Don't show matching bracket when inserting.
o.backup = false
o.laststatus = 2 -- When will last window have a status line. (2 == Always)
o.belloff = "all" -- No bells.
o.clipboard = "unnamedplus"

bo.tabstop = 4
bo.shiftwidth = 4
bo.softtabstop = 4
bo.expandtab = true
bo.autoindent = true
bo.cindent = true
bo.swapfile = false

wo.wrap = false
wo.colorcolumn = "80"
wo.signcolumn = "yes"

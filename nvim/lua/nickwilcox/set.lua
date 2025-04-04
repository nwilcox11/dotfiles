vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.background = "dark"
vim.opt.cursorline = true

vim.opt.smartcase = true
vim.opt.ignorecase = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.belloff = "all"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.formatoptions:remove "o"

vim.g.mapleader = " "
vim.g.markdown_fenced_languages = {
  "ts=typescript"
}

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

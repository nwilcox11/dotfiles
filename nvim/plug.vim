call plug#begin('~/.config/nvim/plugged')
    "Lsp
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
    Plug 'hrsh7th/nvim-compe'
    Plug 'folke/trouble.nvim'
    "Telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    "File Tree
    Plug 'kyazdani42/nvim-tree.lua'
    "Fzf
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    "Git
    Plug 'lewis6991/gitsigns.nvim'
    "Colorschemes
    Plug 'ellisonleao/gruvbox.nvim'
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'navarasu/onedark.nvim'
	Plug 'tomasiser/vim-code-dark'
    "Status Line
    Plug 'hoob3rt/lualine.nvim'
call plug#end()

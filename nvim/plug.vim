call plug#begin('~/.config/nvim/plugged')
    "Lsp
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
    Plug 'hrsh7th/nvim-compe'
    "Telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    Plug 'nvim-telescope/telescope-fzf-writer.nvim'
    "Fzf
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    "Colorschemes
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'navarasu/onedark.nvim'
	Plug 'tomasiser/vim-code-dark'
    "Plug 'joshdick/onedark.vim'
    "Status Line
    Plug 'hoob3rt/lualine.nvim'
call plug#end()

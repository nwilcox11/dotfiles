call plug#begin('~/.config/nvim/plugged')
    "Lsp
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
    Plug 'folke/trouble.nvim'
    Plug 'jose-elias-alvarez/null-ls.nvim'
    "Completion
    Plug 'hrsh7th/nvim-compe'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'onsails/lspkind-nvim'
    Plug 'L3MON4D3/LuaSnip'
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
    Plug 'EdenEast/nightfox.nvim'
    Plug 'Mofiqul/vscode.nvim'
    Plug 'tjdevries/colorbuddy.vim'
    Plug 'tjdevries/gruvbuddy.nvim'
    Plug 'shaunsingh/nord.nvim'
    Plug 'nwilcox11/simplescheme.nvim'
    "Status Line
    Plug 'hoob3rt/lualine.nvim'
call plug#end()

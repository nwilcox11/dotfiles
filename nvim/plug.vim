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
    Plug 'mbbill/undotree'
    "Fzf
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    "Git
    Plug 'lewis6991/gitsigns.nvim'
    "Colorschemes
    Plug 'ellisonleao/gruvbox.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'EdenEast/nightfox.nvim'
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
    "Status Line
    Plug 'hoob3rt/lualine.nvim'
    Plug 'windwp/nvim-autopairs'
    Plug 'akinsho/toggleterm.nvim', {'tag' : 'v1.*'}
call plug#end()

call plug#begin('~/.vim/plugged')
    "Lsp
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
    "Plug 'nvim-lua/completion-nvim'
    Plug 'hrsh7th/nvim-compe'
    "Telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    "Colorschemes
    Plug 'joshdick/onedark.vim'
    "Status Line
    Plug 'hoob3rt/lualine.nvim' 
call plug#end()

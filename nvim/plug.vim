call plug#begin('~/.vim/plugged')
  "Lsp
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  "Completion
  Plug 'hrsh7th/nvim-compe'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'saadparwaiz1/cmp_luasnip'
  Plug 'onsails/lspkind-nvim'
  "Diagnostics
  Plug 'folke/trouble.nvim'
  "Telescope
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  "Git
  Plug 'lewis6991/gitsigns.nvim'
  "Fzf
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  "statusline
  Plug 'nvim-lualine/lualine.nvim'
  "File Tree
  Plug 'kyazdani42/nvim-tree.lua'
  "Colorschemes
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'ellisonleao/gruvbox.nvim'
	Plug 'navarasu/onedark.nvim'
	Plug 'tomasiser/vim-code-dark'
call plug#end()


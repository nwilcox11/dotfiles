-- This file can be loaded by calling `lua require('plugins')` from your init.vim

vim.cmd.packadd("packer.nvim")

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use { 'nvim-lualine/lualine.nvim' }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-treesitter/playground' }

  -- TODO: This seems to cause neovim to crash
  -- use {'nvim-treesitter/nvim-treesitter-context'}

  use { 'mbbill/undotree' }

  -- git
  use {
    'lewis6991/gitsigns.nvim',
    'tpope/vim-fugitive',
  }

  -- Lsp
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  -- Completions
  use {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "L3MON4D3/LuaSnip",
  }

  -- Colors
  use {
    'rose-pine/neovim',
    as = 'rose-pine',
  }
  use { 'folke/tokyonight.nvim' }

  -- markdown
  -- When editing .md files: If we get to a certain level of indentation (bulleted lists, or numbered lists) neovim crashes.
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- Local plugins
  use '~/plugins/show-me-errors.nvim'
  use '~/plugins/fnr.nvim'
end)

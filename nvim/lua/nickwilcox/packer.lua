local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

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
  use { 'nvim-treesitter/nvim-treesitter-context' }

  use { 'mbbill/undotree' }

  -- Git
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

  use { "nvim-pack/nvim-spectre" }

  -- Diagnostics
  use {
    "folke/trouble.nvim",
    "jose-elias-alvarez/null-ls.nvim"
  }

  -- Colors
  use {
    'rose-pine/neovim',
    as = 'rose-pine',
  }
  use { 'folke/tokyonight.nvim' }
  use { "ellisonleao/gruvbox.nvim" }

  -- markdown
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  if packer_bootstrap then
    require("packer").sync()
  end
end)

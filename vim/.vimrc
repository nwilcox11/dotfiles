call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Neovim lsp Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
" Colorschemes
Plug 'gruvbox-community/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'joshdick/onedark.vim'

call plug#end()
"## # Editor Settings
" =======================================
syntax on
filetype plugin indent on
set guicursor=
set noshowmatch
set nohlsearch
set encoding=utf-8
set smartindent
set hidden
set nowrap
set nobackup
set noswapfile
set numberwidth=3
set signcolumn=yes
set visualbell
set noerrorbells
set clipboard=unnamed
set undodir=~/.vim/undodir
set undofile
set termguicolors
set scrolloff=8
set tabstop=4
set shiftwidth=4
set expandtab
set incsearch
set ignorecase
set smartcase
set hlsearch
set number
set relativenumber
set ruler
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
set mouse=a
" Better display messages
set cmdheight=1
set updatetime=1000
" don't give |ins-completion-menu| messages as you type.
set shortmess+=c

" # Keyboard Mappings
" ========================================
let mapleader = " "
let loaded_matchparen = 1
nnoremap <silent> <leader>h :wincmd h<CR>
nnoremap <silent> <leader>j :wincmd j<CR>
nnoremap <silent> <leader>k :wincmd k<CR>
nnoremap <silent> <leader>l :wincmd l<CR>
nnoremap <silent> <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>noremap <C-c> <esc>
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>

inoremap <silent> <C-c> <esc>
nnoremap <silent> <C-c> <esc>

autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

let g:netrw_browse_split =2
let g:netrw_banner = 0
let g:netrw_winsize = 20

"# Colors
" ========================================
set background=dark
colorscheme onedark

"neovim lsp
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_enable_auto_signature = 0

lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.clangd.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.gopls.setup{ on_attach=require'completion'.on_attach }

nnoremap <leader>va :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>

"Search -- (requires ripgrep, fzf)
nnoremap <silent><leader>fg :Rg<CR>
nnoremap <silent><leader>ff :Files<CR>
nnoremap <silent><leader>fh :Helptags<CR>
nnoremap <silent><leader>fb :Buffers<CR>
nnoremap <silent><leader>gs :GFiles?<CR>
nnoremap <silent><leader>gl :Commits<CR>

"neovim tabs
nnoremap <leader>tk :tabnext<CR>
nnoremap <leader>tj :tabprevious<CR>
nnoremap <leader>tc :tabclose<CR>

"fzf layout setup
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

"fzf to current colorscheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

if executable('rg')
    let g:rg_derive_root='true'
endif

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GO syntax
let g:go_highlight_variable_declarations = 1
let g:go_highlight_types = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 0
let g:go_fmt_autosave = 0

fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

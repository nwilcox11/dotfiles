call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" Neovim lsp Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
" Colorschemes
Plug 'gruvbox-community/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'tjdevries/colorbuddy.vim'
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
nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent> <leader>pf :Files<CR>
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
inoremap <silent> <C-c> <esc>

"git
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
"git status
nmap <leader>gs :G<CR>

autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

let g:netrw_browse_split =2
let g:netrw_banner = 0
let g:netrw_winsize = 20
" # Colors
" ========================================
set background=dark
colorscheme onedark

" neovim lsp
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_enable_auto_signature = 0

lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.clangd.setup{ on_attach=require'completion'.on_attach }

nnoremap <leader>va :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>

"Fzf layout setup
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

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

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" Colorschemes
Plug 'gruvbox-community/gruvbox'

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
set tabstop=2
set shiftwidth=2
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
set mouse=n
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
"GoTo code navigation Coc.
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
nnoremap <silent> <leader>cr :CocRestart
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
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection = '0'
colorscheme gruvbox
set background=dark
" Lightline
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
\ }
function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction
" Better display messages
set cmdheight=2
set updatetime=50
" don't give |ins-completion-menu| messages
set shortmess+=c
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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

command! -nargs=0 Prettier :CocCommand prettier.formatFile

autocmd BufWritePre * :call TrimWhitespace()

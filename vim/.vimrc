"Pathogen Configs
execute pathogen#infect()

" # Editor Settings
" =======================================
syntax on
filetype plugin indent on
set encoding=utf-8
set autoindent
set hidden
set nowrap
set nocompatible
set nobackup
set noswapfile
set numberwidth=3
set signcolumn=yes
set visualbell
set noerrorbells
set timeoutlen=300
set clipboard=unnamed

" Tabs
set tabstop=2
set shiftwidth=2

" Proper Search
set incsearch
set ignorecase
set smartcase
set hlsearch

" Sane splits
set splitbelow
set splitright

" # GUI Settings
" ========================================
set number
set relativenumber
set ruler
set colorcolumn=80
set mouse=a
set lazyredraw
set ttyfast
set showcmd

" # Keyboard
" ========================================
" Pane mappings Ctrl h-j-k-l
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

"key mapping for ctrlp
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'

" # Colors
" ========================================
" current colors base16_gruvbox-dark-hard
" previous colors base16_onedark
set background=dark
if filereadable(expand("~/.vimrc_background"))
	let base16colorspace = 256
	source ~/.vimrc_background
endif

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

" Completion
" ==========================================
" Better display messages
set cmdheight=2
set updatetime=300
" don't give |ins-completion-menu| messages
set shortmess+=c
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GO syntax 
let g:go_highlight_variable_declarations = 1
let g:go_highlight_types = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 0
let g:go_fmt_autosave = 0 "GoFmt command will manually reformat

" rust syntax
let g:rustfmt_autosave = 1

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif

" fuzzy search
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

autocmd BufRead,BufNewFile *.md set filetype=markdown

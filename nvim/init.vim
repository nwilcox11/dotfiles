source $HOME/.config/nvim/plug.vim
lua require("settings")
lua require("maps")

syntax on
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab

set path+=**
set undofile
set undodir=~/.vim/undodir

fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

if has('nvim')
  tnoremap <leader><Esc> <C-\><C-n>
endif

autocmd BufWritePre * :call TrimWhitespace()
autocmd BufRead,BufEnter *.astro set filetype=astro

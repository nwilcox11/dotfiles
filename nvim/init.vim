source $HOME/.config/nvim/plug.vim
lua require("settings")
lua require("maps")

syntax on
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set path+=**
set undofile
set undodir=~/.vim/undodir

fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

tnoremap <leader><Esc> <C-\><C-n>

autocmd BufWritePre * :call TrimWhitespace()
autocmd Filetype go setlocal ts=4 sw=4 sts=4 noexpandtab

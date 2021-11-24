source $HOME/.config/nvim/plug.vim
lua require("settings")
lua require("maps")

syntax on
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

colorscheme codedark

set path+=**
set undodir=~/.vim/undodir
set undofile

fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

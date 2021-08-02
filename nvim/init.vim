source $HOME/.config/nvim/plug.vim
lua require("settings")
lua require("maps")

syntax on
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set noexpandtab

set path+=**

fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

let mapleader = " "
set path+=**

"File Tree
let g:netrw_browse_split =2
let g:netrw_banner = 0
let g:netrw_winsize = 20

"Settings
lua require("settings")
"Plugins
runtime ./plug.vim
"Mappings
lua require("maps")

"Color
colorscheme onedark

fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

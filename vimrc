

" We would like syntax highlighting please
syntax enable

" Lets look for syntax highlighting.
set modeline
set modelines=2

" Highlight my search please
set hlsearch

" Highlight whitespace
set list listchars=trail:·,tab:\ \ 

" Add some indent
filetype plugin indent on

" Load the modules.
execute pathogen#infect()	

" Visual Bell.  I don't want a beep
set vb

highlight StatusLineNC cterm=bold ctermfg=white ctermbg=darkgray

" Less timeout for escape keys to become magic escape sequences
" Hopefully makes it easier to get to normal mode.
set ttimeoutlen=10

set sts=2



" We would like syntax highlighting please
syntax enable

" Lets look for syntax highlighting.
set modeline
set modelines=2

" Highlight whitespace
set list listchars=trail:·,tab:\ \ 

" Add some indent
filetype plugin indent on

" Load the modules.
execute pathogen#infect()	

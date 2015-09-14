
" I usually use a dark terminal
:set background=dark

set backspace=indent,eol,start  " more powerful backspacing
set ruler               " show the cursor position all the time

" So map Alt-<hjkl> to be movement keys, even in terminal mode.
" FIXME: Need other modes as well
:tnoremap <A-h> <C-\><C-n><C-w>h
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

syn on


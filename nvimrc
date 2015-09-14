
" I usually use a dark terminal
:set background=dark

set backspace=indent,eol,start  " more powerful backspacing
set ruler               " show the cursor position all the time

" Map Alt-<hjkl> to be movement keys, even in terminal mode.
:tnoremap <A-h> <C-\><C-n><C-w>h
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l
:inoremap <A-h> <C-w>h
:inoremap <A-j> <C-w>j
:inoremap <A-k> <C-w>k
:inoremap <A-l> <C-w>l


syn on

" Change the status line based on mode
set laststatus=2
au InsertEnter * hi StatusLine term=reverse ctermbg=4
au InsertLeave * hi StatusLine term=reverse
hi StatusLine term=reverse ctermbg=0

" Put things in '*' by default: So p/y copy to/from X selections.
set clipboard=unnamed

" Ctrl-C/Ctrl-V yank/paste
:nnoremap <C-v> "+p
:inoremap <C-v> <C-r>+
:vnoremap <C-c> "+y

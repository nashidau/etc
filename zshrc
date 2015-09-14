# FIXME: Should check to see which exists.
export CC="clang"
export CFLAGS="-Wall -O2 -Wextra -Wno-unused-parameter -Wno-sign-compare -g3"
export PROMPT="%~%# "

export PATH=/home/nash/bin:$PATH

unsetopt nomatch

setopt appendhistory
setopt extendedglob

# Zsh completion
zstyle :compinstall filename '/home/nash/.zshrc'
autoload -Uz compinit
compinit

export PERL_LOCAL_LIB_ROOT="/home/nash/perl5:$PERL_LOCAL_LIB_ROOT";
export PERL_MB_OPT="--install_base "/home/nash/perl5"";
export PERL_MM_OPT="INSTALL_BASE=/home/nash/perl5";
export PERL5LIB="/home/nash/perl5/lib/perl5:$PERL5LIB";
export PATH="/home/nash/perl5/bin:$PATH";

autoload -U zmv
alias mmv='noglob zmv -W'
alias O=xdg-open
alias Ox="for i in $* ; xdg-open $i"
alias gvim="nvim -g"
alias gdiff="nvim -g -d"
alias view="nvim -r"

export USE_CCACHE=1

# Urgh... this is a hack, but since I mostly use gnome-terminal it's probably
# fine.  /me waves to future me who is deleting this.
export COLORTERM=${COLORTERM:=gnome-terminal}

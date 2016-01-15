
# Colors: black red green yellow blue magenta cyan white
# To set in prompt use: %{ [...] %}  (So the cursor doesn't move)
# $fg[color]  $reset_color $fg_bold[color]

autoload -U colors && colors

# STY is the screen session name
export PROMPT="%F{blue}${STY}%f%(1n.:.)%{%(?.%F{green}.%F{red})%}%~%#%f "

export PATH=${HOME}/bin:${HOME}/upstream/jdk1.8.0_40/bin:$PATH

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
export PATH="$PATH:${HOME}/work/nx/third-party/gcc-linaro-arm/bin"

export RPMDIR="${HOME}/rpm"

autoload -U zmv
alias mmv='noglob zmv -W'
alias O=xdg-open
alias Ox="for i in $* ; xdg-open $i"
alias gvim="nvim -g"
alias gdiff="nvim -g -d"
alias view="nvim -r"
alias E="nvim -c ':rightb :vsp' -c ':below :sp' -c ':term' -c ':wincmd h'"

export EDITOR=nvim
export VISUAL=nvim

export USE_CCACHE=1

# Urgh... this is a hack, but since I mostly use gnome-terminal it's probably
# fine.  /me waves to future me who is deleting this.
export COLORTERM=${COLORTERM:=gnome-terminal}

# Dir colors:
# `dircolors` prints out `LS_COLORS='...'; export LS_COLORS`, so eval'ing
# $(dircolors) effectively sets the LS_COLORS environment variable.
export eval "$(dircolors)"

bindkey '^R' history-incremental-search-backward

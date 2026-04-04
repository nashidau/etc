
# Do we have a local profile.
LOCALCONFIG=~/.zshrc.local && test -f ${LOCALCONFIG} && source ${LOCALCONFIG}

# Colors: black red green yellow blue magenta cyan white
# To set in prompt use: %{ [...] %}  (So the cursor doesn't move)
# $fg[color]  $reset_color $fg_bold[color]
autoload -U colors && colors

# STY is the screen session name
export PROMPT="%F{blue}${STY}%f%(1n.:.)%{%(?.%F{green}.%F{red})%}%~%#%f "

export PATH=/usr/local/opt/gnu-sed/libexec/gnubin:${HOME}/etc/bin:${HOME}/bin:/usr/local/opt/llvm/bin/clangd:${PATH}

unsetopt nomatch

setopt appendhistory
setopt extendedglob

# Zsh completion
zstyle :compinstall filename '/home/nash/.zshrc'
autoload -Uz compinit
compinit

autoload -U zmv
alias mmv='noglob zmv -W'
alias view="nvim -r"
# Kitty's image viewer:
alias icat="kitty +kitten icat"
alias kssh="kitty +kitten ssh"
alias O=xdg-open
alias Ox="for i in $* ; xdg-open $i"
# Another mac one: Generate compile commands with xc pretty
alias xccc='xcodebuild| xcpretty --report json-compilation-database --output compile_commands.json'

export EDITOR=`which nvim`
export VISUAL=`which nvim`

export PATH=${PATH}:/opt/homebrew/bin:/opt/homebrew/bin/opt/llvm/bin
export PATH=${PATH}:/Users/nash/Library/Python/3.8/bin

alias luamake=/Users/nash/work/upstream/lua-language-server/3rd/luamake/luamake

# FIXME: Should be Mac only
hash -d iCloud=~/Library/Mobile\ Documents/com~apple~CloudDocs/
hash -d Arcane=/Users/nash/work/rmu/roll20/rmu-compendium/books/arcane
hash -d RMURoll20=/Users/nash/work/rmu/roll20/

# So in nvim ZSH loves to go to vim mode for me.  Which makes
# sense in the abstract.  But not to my fingers.  Lets make
# it go to emacs mode.
bindkey -e

zstyle ':completion:*' menu select
fpath+=~/.zfunc

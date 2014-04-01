# FIXME: Should check to see which exists.
export CC="clang"
export CFLAGS="-Wall -O2 -Wextra -Wno-unused-parameter -Wno-sign-compare -g3"
export PROMPT="%~%# "

export PATH=/home/nash/bin:$PATH

unsetopt nomatch

export PERL_LOCAL_LIB_ROOT="/home/nash/perl5:$PERL_LOCAL_LIB_ROOT";
export PERL_MB_OPT="--install_base "/home/nash/perl5"";
export PERL_MM_OPT="INSTALL_BASE=/home/nash/perl5";
export PERL5LIB="/home/nash/perl5/lib/perl5:$PERL5LIB";
export PATH="/home/nash/perl5/bin:$PATH";

autoload -U zmv
alias mmv='noglob zmv -W'
alias O=xdg-open

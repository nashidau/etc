
export LANG=en_AU.UTF-8
export LC_ALL=en_AU.UTF-8

# dotfiles first:w
export LC_COLLATE="C"

# Australian, Brittish, then americana crud
export LANGUAGE=en_AU:en_GB:en

# Homebrew paths
export CPATH=/opt/homebrew/include
export LIBRARY_PATH=/opt/homebrew/lib

# Gems install in a system path by default.
# Instruction from https://ao.ms/how-to-install-a-ruby-gem-without-root-on-a-mac/
export GEM_HOME=~/rubygems/gems
export PATH=${PATH}:${GEM_HOME}/bin

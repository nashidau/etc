# Nash's Config Files

This is a set of my config files.  There is nothing deep here, and I try to
keep my configuration changes small.

I welcome suggestions/pull-requests for improvements.

## Step 1: Install Brew

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Step 2: Install XC

(see below)

## Step 3: Use XC to get the list of targets to update and install

xc ...




Install
-------

	git submodule update --init --recursive

	stow <thing>

	stow -t ~ zsh
	stow -t ~ nvim
	stow -t ~ git 
	stow kitty

    gem install xcpretty

            talloc ghc lua pkg-config check jq \
            wtfis

Adding support for XC
            difi \
https://xcfile.dev/getting-started/#installation

## Tasks

### All

requires: xc, difi, neovim, wtfis, dev, jq, fonts

### neovim

Installs neovim and the common language servers I care about:

```sh
brew install neovim lua-language-server \
            bash-language-server \
            cmake-language-server \
            haskell-language-server \
            typescript-language-server  \
            yaml-language-server
```

### dev

This is a bit of a garbage target: Just random stuff together.

requires: talloc, lua, pkg-config, check

### jq

```sh
brew install jq
```

### talloc

```sh
brew install talloc
```

### lua

```sh
brew install lua
```

### pkg-config

```sh
brew install pkg-config
```

### check

```sh
brew install check
```

### wtfis

WTF is is a tool to lookup network resources.

```sh
brew install wtfis
```

### xc

```sh
brew tap joerdav/xc
brew install xc
```
### difi

```sh
brew tap oug-t/difi
brew install difi
```
### update

```sh
git submodule update --init --recursive
```

### fonts

Fantesetque Mono



```sh
brew install font-fantasque-sans-mono
```

## Not Tasks yet

This will create the links in your home directory.

FIXME: how to install font automatically?

Plug
----

Manually copied the plug.vim to nvim/.local/share/nvim/site/autoload

Should do it automatically at some point.

Hear
----

https://sveinbjorn.org/hear

Git
---

To make things useful across multiple acounts, .gitconfig includes .gituser.

Add your email and any system specific data to that file.

```
[user]
	name = Brett Nash
	email = brett@nash.space
```

You can check you got things right by using: `git config --global --includes user.email`

Aliases:
  - ai: Add interative
  - ri: Rebase interacie
  - rc: Continue a rebase
  - st: Short stats
  - lg: Pretty log
  - tree: tree log
  - figg: diff transposed one to the left
  - remotes: Show all remote commands
  - heads: shall all local heads
  - conflits: Show all conflicting files from a merge (git add to clear)

Zsh
---

Zsh also has a .zshrc.local for system/employer specific BS.

Aliases:
    mmv -> Zsh multiple move 'mmv a*.c a*.h'
    O -> xdg-open (dumb linux open command)(
    view -> Nvim readonky
    kssh -> Kitty ssh
    xccc -> Xcode make compile commands
    icat -> kitty view image

Directory aliases:
    ~iCloud -> Icloud directly


Future work
-----------

   - Fonts
   - System specific aliases

Touch ID Sudo
-------------

add to line after comment in /etc/pam.d/sudo

```
auth sufficient pam_tid.so
```

TreeSitter
----------

Treesitter parsers can be installed using :TSInstall $language in nvim

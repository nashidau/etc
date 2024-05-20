Nash's Config Files
===================

This is a set of my config files.  There is nothing deep here, and I try to
keep my configuration changes small.

I welcome suggestions/pull-requests for improvements.

Install
-------

	git submodule update --init --recursive

	stow <thing>

	stow zsh
	stow nvim
	stow git
	stow kitty

    gem install xcpretty

    brew install neovim 
    treesitter through brew
   

This will create the links in your home directory.

FIXME: how to install font automatically?

Plug
----

Manually copied the plug.vim to nvim/.local/share/nvim/site/autoload

Should do it automatically at some point.

Git
---

To make things useful across multiple acounts, .gitconfig includes .gituser.

Add your email and any system specific data to that file.

```
[user]
	name = Brett Nash
	email = nash@nash.space
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

Fonts
-----

Fantesetque Mono
 
#You only need to do this once for cask-fonts
    brew tap homebrew/cask-fonts

    brew install --cask font-fantasque-sans-mono

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

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

Zsh
---

Zsh also has a .zshrc.local for system/employer specific BS.


Future work
-----------

   - Fonts

Touch ID Sudo
-------------

add to line after comment in /etc/pam.d/sudo

```
auth sufficient pam_tid.so
```

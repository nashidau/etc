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



Future work
-----------

   - Allow it to merge machine specific changes.
   - Make the vim plugins submodules.
   - Fonts


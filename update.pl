#!/usr/bin/perl

@dotfiles = <zshrc zshenv vimrc gvimrc gitconfig>;

$home = $ENV{'HOME'};

foreach $file (@dotfiles) {
	print "ln -sf $home/etc/$file $home/.$file\n";
	system("ln -sf $home/etc/$file $home/.$file");
}

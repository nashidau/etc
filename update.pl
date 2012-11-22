#!/usr/bin/perl

@dotfiles = <zshrc zshenv vimrc gitconfig>;

foreach $file (@dotfiles) {
	
	print "ln -sf /home/nash/etc/$file /home/nash/.$file\n";
	system("ln -sf /home/nash/etc/$file /home/nash/.$file");
}

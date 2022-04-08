#!/usr/bin/perl -w

@dotfiles = <zshrc zshenv vimrc gvimrc gitconfig Xmodmap xinitrc>;

$home = $ENV{'HOME'};
$pwd = `pwd`;
chomp($pwd);

print($pwd, $home);

foreach $file (@dotfiles) {
	print "ln -sf $pwd/$file $home/.$file\n";
	system("ln -sf $pwd/$file $home/.$file");
}

# Nvim now uses ~/.config/nvim/init.vim
system("mkdir -p $home/.config/nvim/");
system("ln -sf $pwd/nvimrc  ~/.config/nvim/init.vim");

# Vim plugo
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

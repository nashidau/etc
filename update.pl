#!/usr/bin/perl -w

@dotfiles = <zshrc zshenv vimrc gvimrc gitconfig Xmodmap xinitrc>;

$home = $ENV{'HOME'};

foreach $file (@dotfiles) {
	print "ln -sf $home/etc/$file $home/.$file\n";
	system("ln -sf $home/etc/$file $home/.$file");
}

# FIXME: Check curl exists, or wget

# Vim stuff
system("mkdir -p ~/.vim/autoload");
if (!-x "~/.vim/autoload/pathogen.vim") {
	system("curl -Sso ~/.vim/autoload/pathogen.vim " .
    	"https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim");
}

system("mkdir -p ~/.vim/bundle");

%vimmodules = (
	numbers => "https://github.com/myusuf3/numbers.vim.git numbers"
);

while (($module, $src) = each (%vimmodules)) {
	print(-d "~/.vim/bundle/$module");
	if (-d "~/.vim/bundle/$module") {
		system("cd ~/.vim/bundle/$module ; git pull");
	} else {
		system("cd ~/.vim/bundle ; git clone $src");
	}
}

system("mkdir -p ~/.fonts");

system("curl -Sso ~/.fonts/CosmicSansNeueMono.otf " .
	"https://raw.github.com/belluzj/cosmic-sans-neue/master/OTF/CosmicSansNeueMono.otf");
system("curl -Sso ~/.fonts/CosmicSansNeueMonoBold.otf " .
	"https://raw.github.com/belluzj/cosmic-sans-neue/master/OTF/CosmicSansNeueMonoBold.otf");

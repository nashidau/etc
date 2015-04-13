#!/usr/bin/perl -w

@dotfiles = <zshrc zshenv vimrc nvimrc gvimrc gitconfig Xmodmap xinitrc>;

$home = $ENV{'HOME'};

foreach $file (@dotfiles) {
	print "ln -sf $home/etc/$file $home/.$file\n";
	system("ln -sf $home/etc/$file $home/.$file");
}

# FIXME: Check curl exists, or wget

# Vim stuff
system("mkdir -p ~/.vim/autoload");
if (!-x "~/.vim/autoload/pathogen.vim") {
	system("curl -LSso ~/.vim/autoload/pathogen.vim " .
    	"https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim");
}

# Cscope for vim:
if (!-x "~/.vim/plugin/cscope_maps.vim") {
	system("mkdir -p ~/.vim/plugin");
	system("curl -LSso ~/.vim/plugin/cscope_maps.vim " .
		"http://cscope.sourceforge.net/cscope_maps.vim");
}

system("mkdir -p ~/.vim/bundle");

%vimmodules = (
	lldb => "https://github.com/gilligan/vim-lldb.git lldb",
	fugitive => "git://github.com/tpope/vim-fugitive.git"
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

system("curl -SLso ~/.fonts/CosmicSansNeueMono.otf " .
	"https://raw.github.com/belluzj/cosmic-sans-neue/master/OTF/CosmicSansNeueMono.otf");
system("curl -SLso ~/.fonts/CosmicSansNeueMonoBold.otf " .
	"https://raw.github.com/belluzj/cosmic-sans-neue/master/OTF/CosmicSansNeueMonoBold.otf");

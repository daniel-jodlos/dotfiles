alias config='/usr/bin/git --git-dir=$HOME/Dokumenty/dotfiles/ --work-tree=$HOME'

function config_all
    set prev (pwd)
    config add (config status -s | grep '^ M' | cut -d' ' -f3)
    cd $prev
end

function edit
	set prev (pwd)
	cd $HOME
	set path (config ls-tree -r master --name-only | fzf)
	nvim $path
	config add $path
	cd $prev
end

function dotfile
	nvim $argv
	config add $argv
end

function dotfiles_update
    config checkout -f
end

funcsave edit
funcsave dotfile
funcsave config
funcsave config_all
funcsave dotfiles_update

alias config='/usr/bin/git --git-dir=$HOME/Dokumenty/dotfiles/ --work-tree=$HOME'

function config_push
	config add $argv
	config commit -m "Updated config for $argv"
	nohup timeout 30 config push -q 2>&1 &
end

function edit
	set prev (pwd)
	cd $HOME
	set path (config ls-tree -r master --name-only | fzf)
	nvim $path
	config_push $path
	cd $prev
end

function dotfile
	nvim $argv
	config_push $argv
end

funcsave config_push
funcsave edit
funcsave dotfile
funcsave config

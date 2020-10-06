alias config='/usr/bin/git --git-dir=$HOME/Dokumenty/dotfiles/ --work-tree=$HOME'

function config_push
	config add $argv
	config commit -m "Updated config for $argv"
	config push > /dev/null
end

function edit
	set path $HOME/(git ls-tree -r master --name-only | fzf)
	nvim $path
	config_push $path
end

function dotfile
	nvim $argv
	config_push $argv
end

funcsave config_push
funcsave edit
funcsave dotfile
funcsave config

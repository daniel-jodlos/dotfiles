omf install fzf sashimi
omf theme sashimi

set -U FZF_FIND_FILE_COMMAND 'ag -l --hidden --ignore .git . $dir 2> /dev/null'
set -U FZF_COMPLETE '0'
set -U EDITOR 'nvim'

source $HOME/Dokumenty/dotfiles/functions.fish

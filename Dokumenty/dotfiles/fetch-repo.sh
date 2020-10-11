#!/usr/bin/env bash
#set -euo pipefail

cd $HOME
git --bare clone git@github.com:daniel-jodlos/dotfiles.git $HOME/Dokumenty/dotfiles
/usr/bin/git --git-dir=$HOME/Dokumenty/dotfiles/ --work-tree=$HOME checkout -f

#!/bin/bash

sudo pacman -Syy
sudo pacman -S git github-cli wmname fish

cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R daniel:users ./yay-git
cd yay-git
makepkg -sri

# setup oh my fish
curl -L https://get.oh-my.fish | fish
chsh -s /usr/bin/fish

# install spotify
gpg --keyserver hkp://keyserver.ubuntu.com --receive-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
curl -sS https://download.spotify.com/debian/pubkey.gpg | gpg --import -
yay -S spotify


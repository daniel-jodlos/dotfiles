#!/bin/bash

sudo pacman -Syy
sudo pacman -S git github-cli

cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R daniel:users ./yay-git
cd yay-git
makepkg -sri

gpg --keyserver hkp://keyserver.ubuntu.com --receive-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
curl -sS https://download.spotify.com/debian/pubkey.gpg | gpg --import -
yay -S spotify

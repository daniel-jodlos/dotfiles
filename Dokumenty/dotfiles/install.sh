#!/bin/bash

sudo pacman -Syy
sudo pacman -S git github-cli wmname fish gcc make linux-headers

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


## ATTENTION! ONLY FOR TPLINK WIRELESS CARD!!!!
# install proper driver that's not shit
cd /tmp
git clone https://github.com/lwfinger/rtl8192ee.git
cd rtl8192ee
make all
sudo make install
echo "blacklist rtl8192ee" | sudo tee -a /etc/modprobe.d/50-blacklist.conf
echo "8192ee" | sudo tee -a /etc/modules-load.d/8192ee.conf
# end of driver install

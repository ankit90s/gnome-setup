#!/bin/bash

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo -e "\e[1;31m Please run as sudo or root \e[0m"
  exit 1
fi

clear

# Get username
username=$(id -u -n 1000)
builddr=$(pwd)

# Copy Source file
mv /etc/apt/sources.list /etc/apt/sources.list.bkp
cp sources.list /etc/apt/sources.list
apt update && apt upgrade -y

# clean bloatware
apt autoremove -y gnome-games hdate hdate-applet thunderbird totem gnome-music cheese kasumi xiterm+thai goldendict mlterm evolution

# install terminal based applications
apt install -y wget axel curl ranger htop translate-shell cmatrix alacritty exa kitty nvidia-detect fzf bash-completion

# install applications
apt install -y mpv mpv-mpris

# install libreoffice themes
apt install -y libreoffice-style*

# install linux mint packages
apt install -y mint-y-icons mintstick

# packages needed to for gtk theme installation
apt install -y gnome-themes-extra gtk2-engines-murrine sassc

# install restricted extras
apt install -y ttf-mscorefonts-installer rar unrar libavcodec-extra gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi

# install microsoft compatibility layer
apt install -y fonts-crosextra-carlito fonts-crosextra-caladea

# install build-essential
apt install -y build-essential dkms linux-headers-$(uname -r)

# reboot the machine
reboot

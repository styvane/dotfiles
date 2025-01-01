#!/bin/sh

apt install unzip zip \
     build-essential libssl-dev zlib1g-dev libsqlite3-dev libffi-dev tcl-dev libgdbm-dev libreadline-dev tk tk-dev libexpat1-dev libncurses5-dev \

     apt install rxvt-unicode-256color xclip alsa-utils htop strace i3 i3lock suckless-tools \
	 net-tools wget curl git feh sudo emacs fonts-firacode dnsutils sudo

apt install pulseaudio avahi-daemon pavucontrol
apt install  xorg x11-apps x11-utils x11-xserver-utils  x11-session-utils

rmmod pcspkr ; echo "blacklist pcspkr" >> /etc/modprobe.d/blacklist.conf
modprobe -r iwlwifi ; modprobe iwlwifi

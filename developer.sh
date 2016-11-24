#!/bin/bash

DOT_FILES=${1-thepwagner}

# Handy packages:
sudo apt-get update
sudo apt-get -y install \
	curl \
	git \
	psmisc \
	tmux \
	vim-nox \
	zsh

# Dotfiles:
cd /home/space
if [ ! -d .git ]; then
	git init .
	git remote add origin https://github.com/${DOT_FILES}/dotfiles
	git fetch
	git reset --hard origin/master
	git submodule init
	git submodule update
fi
sudo chsh -s /usr/bin/zsh space

# Copy to root (vim as root is common!)
sudo rsync -r /home/space /root
sudo chown -R root:root /root
sudo chsh -s /usr/bin/zsh root

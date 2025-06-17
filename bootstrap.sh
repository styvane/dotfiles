#!/bin/sh

cd "$(dirname "${BASH_SOURCE}")";

git pull origin main;

function doIt() {
    if [[ "$OSTYPE" =~ ^darwin ]]; then
	    rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
	        --exclude ".linux" \
		--exclude ".i3/" \
		--exclude ".urxvt" \
		--exclude ".xsessionrc" \
		--exclude ".Xresources" \
		--exclude ".Xprofile" \
		--exclude "apt.sh" \
		--exclude "firefox.desktop" \
		--exclude "install.sh" \
		--exclude "jon-tyson-unsplash.jpg" \
                --exclude ".extra" \
	        -avh --no-perms . ~;
	else
	    rsync --exclude ".git/" \
		--exclude ".DS_Store" \

		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude ".macos" \
		--exclude "brew.sh" \
		--exclude "apt.sh" \
		--exclude "firefox.desktop" \
		--exclude "install.sh" \
		--exclude "jon-tyson-unsplash.jpg" \
                --exclude ".extra" \
		-avh --no-perms . ~;

	fi
	./install.sh;
	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;

#!/bin/sh

ALACRITTY_THEMES_DIR="$HOME/.config/alacritty/themes"

if [ ! -d "$ALACRITTY_THEMES_DIR" ]; then
    # Install Alacritty themes
    mkdir -p "$ALACRITTY_THEMES_DIR";
    git clone https://github.com/alacritty/alacritty-theme "$ALACRITTY_THEMES_DIR";
fi

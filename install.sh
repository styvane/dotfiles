#!/bin/sh


OSTYPE=$(uname|tr '[:upper:]' '[:lower:]')

if [[ "$OSTYPE" =~ ^darwin ]]; then
    ./brew.sh
else
    ./apt.sh
fi

# Install Rust toolchains and bins
./install_rs.sh

# Install GHc
export BOOTSTRAP_HASKELL_NONINTERACTIVE=1
export BOOTSTRAP_HASKELL_INSTALL_HLS=Y
export BOOTSTRAP_HASKELL_ADJUST_BASHRC=N
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

# Install uv
curl -LsSf https://astral.sh/uv/install.sh | sh

# Install pre-commit
uv tool install pre-commit

alacritty_theme_dir="$HOME/.config/alacritty/themes"

if [ ! -d "$alacritty_theme_dir" ]; then
    # Install Alacritty themes
    mkdir -p ~/.config/alacritty/themes;
    git clone https://github.com/alacritty/alacritty-theme "$alacritty_theme_dir";
fi

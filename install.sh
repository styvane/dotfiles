#!/bin/sh

OSTYPE=$(uname|tr '[:upper:]' '[:lower:]')

if [[ "$OSTYPE" =~ ^darwin ]]; then
    ./brew.sh
else
    ./apt.sh
fi

# Install Rust toolchains and bins
./rust.sh

# Install Python toolchains and bins
./python.sh

# Install Haskell toolchains
./haskell.sh

# Install Javascript, Typescript toolchains
./javascript.sh

# Post Installation script
./post-install.sh

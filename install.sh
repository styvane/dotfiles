#!/bin/sh


OSTYPE=$(uname|tr '[:upper:]' '[:lower:]')

if [[ "$OSTYPE" =~ ^darwin ]]; then
    ./brew.sh
else
    ./apt.sh
fi

# Install GHc
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

# Install uv
curl -LsSf https://astral.sh/uv/install.sh | sh

# Install pre-commit
uv tool install pre-commit

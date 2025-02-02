#!/bin/sh

# Install GHc
export BOOTSTRAP_HASKELL_NONINTERACTIVE=1
export BOOTSTRAP_HASKELL_INSTALL_HLS=Y
export BOOTSTRAP_HASKELL_ADJUST_BASHRC=N
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

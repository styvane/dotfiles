#!/bin/sh

curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
curl -LsSf https://astral.sh/uv/install.sh | sh

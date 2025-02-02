#!/bin/sh

curl -LsSf https://astral.sh/uv/install.sh | sh

# Install useful Python tools
uv tool install \
   jupyterlab \
   pre-commit \
   ruff \
   tox --with tox-uv \
   voila

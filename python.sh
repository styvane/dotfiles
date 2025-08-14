#!/bin/sh

curl -LsSf https://astral.sh/uv/install.sh | sh

# Install useful Python tools
uv tool install jupyterlab
uv tool install pre-commit
uv tool install ruff
uv tool install tox --with tox-uv
uv tool install ty
uv tool install voila

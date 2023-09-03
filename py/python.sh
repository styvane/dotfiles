#!/bin/sh


# Install poetry
curl -sSL https://install.python-poetry.org | python3 -

VENV_PATH="${HOME}/.local/pytools/"
python3 -m venv $VENV_PATH

alias pip="$VENV_PATH/bin/pip"

pip install -U pip \
    setuptools \
    poetry \
    maturin

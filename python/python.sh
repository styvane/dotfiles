#!/bin/sh

# Install pdm
curl -sSL https://pdm-project.org/install-pdm.py | python3 -

python3 -m pip install -U pip \
    setuptools \
    maturin

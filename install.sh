#!/bin/sh

OSTYPE=$(uname|tr '[:upper:]' '[:lower:]')

if [[ "$OSTYPE" =~ ^darwin ]]; then
    ./brew.sh
else
    ./apt.sh

#!/usr/bin/env bash


# Install Opam
brew install opam

# Initialize opam to create the default switch.
# A switch is an isolated environment for Ocaml compiler and any package you
# will install.
opam init -y --no-setup --enable-completion

# Install  development environment
opam install -y ocaml-lsp-server odoc ocamlformat utop dune

# Note: Uninstall binutils in case of linker issue

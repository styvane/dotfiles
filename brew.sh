#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install a modern version of Bash.
brew install bash
brew install bash-completion2

# Install latex.
brew cask install mactex

# Install jq.
brew install jq

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget`.
brew install wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
brew install openssh
brew install gmp
brew install curl
brew install emacs
brew install tmux

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install bfg
brew install binutils
brew install binwalk
brew install nmap
brew install xz

# Install other useful binaries.
brew install git
brew install git-lfs
brew install gs
brew install lua
brew install p7zip
brew install rename
brew install ssh-copy-id
brew install tree
brew install pgformatter
brew install clang-format
brew install libpq
brew install nushell

# Install protobuf
brew install protobuf

# Install remarkable
brew install --cask remarkable

# Install Python tools
brew install pipx && pipx ensurepath
pipx install maturin
pipx install pdm

# Install programming languages compilers and tools.
brew install llvm
brew install opam
brew install racket
brew install smlnj
tla-plus-toolbox

# Remove outdated versions from the cellar.
brew cleanup

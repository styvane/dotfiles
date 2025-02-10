#!/bin/sh

set -x
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
brew install --cask mactex

# Install JSON tools
brew install jq gron

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
brew vim \
     grep \
     nano \
     openssh \
     gmp \
     curl

# better `top`
brew install bottom

# Install emacs
brew install --cask emacs


# Install better terminal
brew install --cask ghostty

# Install tmux
brew install tmux

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew bfg \
     binutils \
     binwalk \
     nmap \
     xz

# Install other useful binaries.
brew install git \
     git-lfs \
     gs \
     lua \
     p7zip \
     rename \
     ssh-copy-id \
     tree \
     pgformatter \
     clang-format \
     libpq \
     nushell \
     markdown \
     cmake \
     fzf \

# Install protobuf
brew install protobuf

# Install remarkable
brew install --cask remarkable

# Install programming languages compilers and tools.
brew install llvm
brew install opam

# Install tla+
brew install --cask tla-plus-toolbox


# Install smlnj
brew install --cask smlnj
brew install smlfmt

# Install racket
brew install --cask racket

# Install full latex
brew install --cask mactex

# Install Typst
brew install typst

# Install zig and tools
brew install zig
brew install zls

# Remove outdated versions from the cellar.
brew cleanup

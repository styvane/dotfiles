#!/bin/sh

set -x

# Install Homebrew
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

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
brew install gron jq

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
brew install curl \
     gmp \
     nano \
     openssh \
     grpcurl

# Install emacs
brew install --cask emacs


# Install better terminal
brew install --cask ghostty

# Install tmux
brew install tmux

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install bfg \
     binutils \
     binwalk \
     nmap \
     xz

# Install better vim
brew install helix

# Install other useful binaries.
brew install clang-format \
     cmake \
     fzf \
     git \
     git-lfs \
     gs \
     libpq \
     lua \
     markdown \
     pgformatter \
     p7zip \
     rename \
     ssh-copy-id \
     yaml-language-server

# Install protobuf
brew install protobuf

# Install remarkable
brew install --cask remarkable

# Install programming languages compilers and tools.
brew install llvm

# Install tla+
brew install --cask tla-plus-toolbox

# Install smlnj
brew install --cask smlnj
brew install smlfmt

# Install racket
brew install --cask racket

# Install better merge tool
brew install --cask meld

# Install Typst
brew install typst

# Install YAML language server
brew install yaml-language-server

# Install zig and tools
brew install zig
brew install zls

# Install HTML language server
brew install superhtml

# Remove outdated versions from the cellar.
brew cleanup

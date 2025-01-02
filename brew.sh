#!/bin/sh

if which brew &> /dev/null; then
  # Make sure we’re using the latest Homebrew.
  brew update;
  # Upgrade any already-installed formulae.
  brew upgrade;
else
  # Install Homebrew
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Add Homebrew to path.
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
	eval "$(/opt/local/bin/brew shellenv)";
fi



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
brew install vim
brew install grep
brew install nano
brew install openssh
brew install gmp
brew install curl

# better `top`
brew install bottom

# Install emacs
brew install --cask emacs


# Install better terminal
brew install --cask alacritty

# Install tmux
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
brew install markdown

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
# brew install --cask smlnj

# Install racket
brew install --cask racket

# Install full latex
brew install --cask mactex

# Install Typst
brew install typst

# Remove outdated versions from the cellar.
brew cleanup

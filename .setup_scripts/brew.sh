#!/bin/bash -e

echo "Starting brew.sh..."
echo "Checking if brew is installed"
if ! command -v brew &> /dev/null ;  then
    echo "Installing Brew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "Brew installation...done"
fi

echo "Updating Brew"
brew update
brew upgrade
echo "Updating...done"

echo "Tapping fonts..."
brew tap homebrew/cask-fonts
echo "Tapping...done"

echo "Installing Brew Packages..."
brew install git
brew install yadm
brew install zsh
brew install tldr
brew install romkatv/powerlevel10k/powerlevel10k
brew install topgrade
brew install dnscrypt-proxy
brew install autojump
brew install neovim
brew install pinentry-mac # Needed for gpg signing
echo "Packages...done"

echo "Installing Brew Applications..."
brew install --cask iterm2
brew install --cask spotify
brew install --cask visual-studio-code
brew install --cask font-meslo-lg-nerd-font
brew install --cask appcleaner
brew install --cask alfred
brew install --cask bartender
echo "Casks...done"

echo "Brew...done"

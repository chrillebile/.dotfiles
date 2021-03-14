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
brew install git yadm zsh python tldr romkatv/powerlevel10k/powerlevel10k topgrade dnscrypt-proxy
echo "Packages...done"

echo "Installing Brew Applications..."
brew install --cask iterm2 spotify visual-studio-code font-meslo-lg-nerd-font
echo "Casks...done"

echo "Starting brew services"
sudo dnscrypt-proxy -config ~/.config/dnscrypt-proxy/dnscrypt-proxy.toml
sudo brew services start dnscrypt-proxy
echo "Starting brew services...done"

echo "Brew...done"

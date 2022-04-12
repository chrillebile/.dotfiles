#!/bin/bash -e

echo "Starting general.sh..."

echo "Checking if oh-my-zsh exists"
if ! command -v omz &> /dev/null ;  then
    echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo "Installation...done"
fi

echo "Installing external oh-my-zsh plugins"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/plugins/zsh-autosuggestions
echo "Installing external oh-my-zsh plugins...done"

echo "Installing NVChad"
git clone https://github.com/NvChad/NvChad ~/.config/nvim
echo "Run the following in order to complete the installation of nvchad: nvim +'hi NormalFloat guibg=#1e222a' +PackerSync"
echo "Installing NVChad...done"

echo "Setting up pinentry"
mkdir -p "$HOME"/.gnupg
echo "pinentry-program /usr/local/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf
if pgrep gpg-agent ; then
  killall gpg-agent ; fi
echo "Setting up pinentry...done"

echo "General...done"

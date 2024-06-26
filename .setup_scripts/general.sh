#!/bin/bash -e

echo "Starting general.sh..."

echo "Checking if oh-my-zsh exists"
if ! command -v omz &>/dev/null; then
    echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo "Installation...done"
fi

echo "Installing external oh-my-zsh plugins"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/plugins/zsh-autosuggestions
echo "Installing external oh-my-zsh plugins...done"

echo "installing nvchad"
git clone https://github.com/nvchad/nvchad "$home"/.config/nvim
echo "run the following in order to complete the installation of nvchad: nvim +'hi normalfloat guibg=#1e222a' +packersync"
echo "installing nvchad...done"

echo "General...done"

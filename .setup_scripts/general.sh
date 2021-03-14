#!/bin/bash -e

echo "Starting general.sh..."

echo "Checking if oh-my-zsh exists"
if ! command -v omz &> /dev/null ;  then
    echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo "Installation...done"
fi

echo "General...done"

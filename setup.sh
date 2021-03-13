#!/bin/bash

echo "Starting setup"
echo "Password might be needed..."

echo "Making setup script executable..."
chmod u+x ~/.config/general.sh
chmod u+x ~/.config/brew.sh
chmod u+x ~/.config/link_config.sh
echo "chmod...done"

echo "Installering defaults..."
. ~/.config/general.sh
. ~/.config/brew.sh
echo "Installing defaults...done"

echo "Installing configs..."
. ~/.config/link_config.sh
echo "Configs...done"

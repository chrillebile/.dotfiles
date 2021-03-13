#!/bin/bash

echo "Starting setup"
echo "Password might be needed..."

echo "Making setup script executable..."
chmod u+x .setup_scripts/general.sh
chmod u+x .setup_scripts/brew.sh
chmod u+x .setup_scripts/link_config.sh
echo "chmod...done"

echo "Installering defaults..."
./.setup_scripts/general.sh
./.setup_scripts/brew.sh
echo "Installing defaults...done"

echo "Installing configs..."
./.setup_scripts/link_config.sh
echo "Configs...done"

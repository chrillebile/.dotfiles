#!/bin/bash

check_fail() {
  if [ $? -eq 0 ] ; then
    echo "$@...SUCCESS"
  else
    echo "$@...FAILED"
}

echo "Starting setup"
echo "Password might be needed..."

echo "Making setup script executable..."
chmod u+x .setup_scripts/general.sh
chmod u+x .setup_scripts/brew.sh
chmod u+x .setup_scripts/link_config.sh
echo "chmod...done"

echo "Installering defaults..."
./.setup_scripts/general.sh
check_fail "GENERAL"
-e ./.setup_scripts/brew.sh
check_fail "BREW"
echo "Installing defaults...done"

echo "Installing configs..."
./.setup_scripts/link_config.sh
check_fail "LINK_CONFIG"
echo "Configs...done"

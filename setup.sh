#!/bin/bash -e

echo "Starting setup"
echo "Password might be needed..."

echo "Making setup script executable..."
chmod u+x .setup_scripts/brew.sh
chmod u+x .setup_scripts/general.sh
chmod u+x .setup_scripts/link_config.sh
echo "chmod...done"

failed=false

echo "Installering defaults..."
if ! ./.setup_scripts/brew.sh ; then
  echo "BREW...FAILED"
  failed=true ; fi
if ! ./.setup_scripts/general.sh ; then
  echo "GENERAL...FAILED"
  failed=true ; fi
echo "Installing defaults...done"

echo "Installing configs..."
if ! ./.setup_scripts/link_config.sh ; then
  echo "LINK_CONFIG...FAILED"
  failed=true ; fi
echo "Configs...done"

if $failed ; then
  echo "SETUP FAILED! Check logs..."
  exit 1 ; fi


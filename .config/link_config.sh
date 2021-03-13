#!/bin/bash

echo "Starting link_config.sh..."
files = ["~/.pk10.zsh", "~/.zshrc"]

echo "Removing default configs"
for f in $files ; do
    if [ -f $f ] ; then
        rm $f
        echo "Removed...$f"
    fi 
done
echo "Removing defaults...done"

echo "Linking configs with -s"
ln -s ~/.config/pk10/.pk10.zsh ~/.pk10.zsh
ln -s ~/.config/oh-my-zsh/.zshrc ~/.zshrc
echo "Linking...done"

echo "Linking configs...done"

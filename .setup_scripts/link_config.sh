#!/bin/bash -e

echo "Starting link_config.sh..."
files=("$HOME/.pk10.zsh" "$HOME/.zshrc")

echo "Removing default configs"
for f in "${files[@]}"; do
  if [ -f "$f" ]; then
    rm "$f"
    echo "Removed...$f"
  fi
done
echo "Removing defaults...done"

mkdir -p "$HOME"/.config/nvim/lua/custom/plugins

echo "Linking configs with ln -s"
ln -s "$HOME"/.config/pk10/.pk10.zsh "$HOME"/.pk10.zsh
ln -s "$HOME"/.config/oh-my-zsh/.zshrc "$HOME"/.zshrc
echo "Linking...done"

echo "Linking configs...done"

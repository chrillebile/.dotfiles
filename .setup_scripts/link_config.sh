#!/bin/bash -e

echo "Starting link_config.sh..."
files=("$HOME/.pk10.zsh" "$HOME/.zshrc")

echo "Removing default configs"
for f in "${files[@]}" ; do
    if [ -f "$f" ] ; then
        rm "$f"
        echo "Removed...$f"
    fi 
done
echo "Removing defaults...done"

mkdir -p "$HOME"/.config/nvim/lua/custom/plugins

echo "Linking configs with ln -s"
ln -s "$HOME"/.config/pk10/.pk10.zsh "$HOME"/.pk10.zsh
ln -s "$HOME"/.config/oh-my-zsh/.zshrc "$HOME"/.zshrc
#ln -s "$HOME"/.config/nvchad/init.lua "$HOME"/.config/nvim/lua/custom/init.lua
#ln -s "$HOME"/.config/nvchad/chadrc.lua "$HOME"/.config/nvim/lua/custom/chadrc.lua
#ln -s "$HOME"/.config/nvchad/mappings.lua "$HOME"/.config/nvim/lua/custom/mappings.lua
#ln -s "$HOME"/.config/nvchad/plugins/init.lua "$HOME"/.config/nvim/lua/custom/plugins/init.lua
#ln -s "$HOME"/.config/nvchad/plugins/configs.lua "$HOME"/.config/nvim/lua/custom/plugins/configs.lua
#ln -s "$HOME"/.config/nvchad/plugins/lspconfig.lua "$HOME"/.config/nvim/lua/custom/plugins/lspconfig.lua

echo "Linking configs with their tag"
if ! command -v dnscrypt-proxy &> /dev/null ;  then
    sudo dnscrypt-proxy -config ~/.config/dnscrypt-proxy/dnscrypt-proxy.toml
    echo "To start dnscrypt-proxy run:"
    echo "'sudo brew services start dnscrypt-proxy'"
fi

echo "Linking iTerms2 config"
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "${HOME}/.config/iterm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
echo "Linking...done"

echo "Linking configs...done"

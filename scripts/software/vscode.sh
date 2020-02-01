#!/bin/bash

# Visual Studio Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt install -y apt-transport-https
sudo apt update
sudo apt install -y code
rm packages.microsoft.gpg

# Symlink settings
rm $HOME/.config/Code/User/settings.json
rm $HOME/.config/Code/User/keybindings.json

ln -s $(pwd)/../../vscode/settings.json $HOME/.config/Code/User/settings.json
ln -s $(pwd)/../../vscode/keybindings.json $HOME/.config/Code/User/keybindings.json

function installExt {
    code --install-extension ${1} --force
}

# Install extensions
installExt esbenp.prettier-vscode

#!/bin/bash

# Visual Studio Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt install -y code
rm packages.microsoft.gpg

# Symlink settings & keybindings
mkdir $HOME/.config/Code
mkdir $HOME/.config/Code/User

ln -s $(pwd)/../../vscode/settings.json $HOME/.config/Code/User/settings.json
ln -s $(pwd)/../../vscode/keybindings.json $HOME/.config/Code/User/keybindings.json

function installExt {
    code --install-extension ${1} --force
}

# Install extensions
installExt esbenp.prettier-vscode
installExt pkief.material-icon-theme
installExt coenraads.bracket-pair-colorizer
installExt s3anmorrow.color-stamp
installExt ritwickdey.liveserver
installExt dsznajder.es7-react-js-snippets
installExt bmewburn.vscode-intelephense-client
installExt ms-python.python

echo -e "🛠️ VS Code Installed!\n"

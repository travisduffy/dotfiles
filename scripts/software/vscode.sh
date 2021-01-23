#!/bin/bash

#--- Visual Studio Code


# Download & install
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt install -y code
rm packages.microsoft.gpg

function installExt {
    code --install-extension ${1} --force
}

# Install extensions
installExt esbenp.prettier-vscode
installExt pkief.material-icon-theme
installExt coenraads.bracket-pair-colorizer
installExt s3anmorrow.color-stamp # thanks Sean!
installExt ritwickdey.liveserver
installExt dsznajder.es7-react-js-snippets

# Add personal configs
rm -f ~/.config/Code/User/settings.json
rm -f ~/.config/Code/User/keybindings.json
cp ../../vscode/settings.json ~/.config/Code/User/settings.json
cp ../../vscode/keybindings.json ~/.config/Code/User/keybindings.json

echo -e "🛠️ VS Code Installed!\n"

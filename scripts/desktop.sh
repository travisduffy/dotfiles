#!/bin/bash

# Regolith Desktop Environment
sudo add-apt-repository -y ppa:kgilmer/regolith-stable
sudo apt install regolith-desktop -y

# Symlink configs
rm -f ~/.config/regolith
cp -r ../regolith ~/.config/regolith

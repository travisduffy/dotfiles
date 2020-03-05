#!/bin/bash

# Node.js
sudo add-apt-repository -y -r ppa:chris-lea/node.js
curl -sSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo apt-key add -

VERSION='node_13.x'
DISTRO="$(lsb_release -s -c)"

echo "deb https://deb.nodesource.com/$VERSION $DISTRO main" | sudo tee /etc/apt/sources.list.d/nodesource.list
echo "deb-src https://deb.nodesource.com/$VERSION $DISTRO main" | sudo tee -a /etc/apt/sources.list.d/nodesource.list

sudo apt install -y nodejs

# Update npm
sudo npm install -g npm

echo -e "🛠️ Node.js Installed!\n"

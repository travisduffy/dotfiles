#!/bin/bash

# Run this file to setup the system!

bold=$(tput bold)
reset=$(tput sgr0)

# Update apt packages
echo -e "\n🛠️  ${bold}Updating packages${reset}  🛠️\n"
sudo apt update

# Run scripts
echo -e "\n🛠️  ${bold}Running scripts${reset}  🛠️\n"
./symlinks.sh
./aptinstall.sh
./software.sh

# Get all upgrades
echo -e "\n🛠️  ${bold}Upgrading packages${reset}  🛠️\n"
sudo apt upgrade -y
sudo apt clean
sudo apt autoremove -y --purge

# Load bash customization
source ~/.bashrc

# Complete
echo -e "\n🎉  ${bold}Setup complete!${reset}  🎉\n"

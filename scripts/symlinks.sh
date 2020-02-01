#!/bin/bash

# Move up to dotfiles root dir
cd ..

dotfilesDir=$(pwd)

function linkDotfile {
  dest="${HOME}/${1}"
  dateStr=$(date +%Y-%m-%d-%H%M)

  if [ -h ~/${1} ]; then
    # Existing symlink 
    echo "Removing existing symlink: ${dest}"
    rm ${dest} 

  elif [ -f "${dest}" ]; then
    # Existing file
    echo "Backing up existing file: ${dest}"
    mv ${dest}{,.${dateStr}}

  elif [ -d "${dest}" ]; then
    # Existing dir
    echo "Backing up existing dir: ${dest}"
    mv ${dest}{,.${dateStr}}
  fi

  echo "Creating new symlink: ${dest}"
  ln -s ${dotfilesDir}/${1} ${dest}
}

# Link all dotfiles
linkDotfile .bashrc
linkDotfile .bash_profile
linkDotfile .gitconfig

# Link fonts
if [ -h ~/.fonts ]; then
    echo "Removing existing fonts"
    rm -rf ~/.fonts
fi

ln -s ${dotfilesDir}/.fonts ~/

if [ -h ~/.fonts/.uuid ]; then
    rm ${dotfilesDir}/.fonts/.uuid
fi

echo "Fonts linked"

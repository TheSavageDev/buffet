#!/usr/bin/env bash

# Get them creds
sudo -v

# Keep-them
./utils/keepcreds.sh

# Changing Shell to zsh
echo "Changing shell to zsh"
sh -c "echo $(which zsh)" >> /etc/shells
chsh -s $(which zsh)
source ~/.zshrc

# Update and Install XCode
echo "####################"
echo "Updating OSX. This might require and restart. If it does, rerun the script."

# Update
sudo softwareupdate -ir --verbose

echo "####################"
echo "Installing XCode..."
xcode-select --install

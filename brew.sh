#!/usr/bin/env bash

# Install cli tools with brew

# Run checkForBrew.sh
./utils/checkForBrew.sh

# Upgrade exsisting formulae
bundle upgrade --all

# Python
echo "Installing python..."
brew install python
brew install python3

# Git
echo "Installing git..."
brew install git

# Core casks

# Development casks
brew cask install --appdir="/Applications" visual-studio-code-insiders

# Miscellanious casks
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" microsoft-teams

# Docker
brew install docker

# Clean up
echo "Cleaning up after myself..."
brew cleanup
echo "Done!"

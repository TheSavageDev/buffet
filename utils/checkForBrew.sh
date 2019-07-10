#!/usr/bin/env bash
Install cli tools using Homebrew

# Admin password
sudo -v

# Keep sudo alive
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew. Install if not there
if test ! $(which brew); then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubuser.content.com/Homebrew/install/master/install)"
fi

# Update brew
brew update

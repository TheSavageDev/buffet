#!/usr/bin/env bash

# Get them creds
sudo -v

# Keep-them
./utils/keepcreds.sh

# Disable hibernation
sudo pmset -a hibernatemode 0

# Disable sudden motion sensor because we have SSDs
sudo pmset -a sms 0

# Fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 15


# TODO Add customizations to other applications

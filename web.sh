#!/usr/bin/env bash

# Run checkForBrew
./utils/checkForBrew.sh

echo "Installing nvm via curl to GitHub..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

# Clean up after ourselves
echo "Cleaning up after ourselves..."
brew cleanup

echo "Installing npm global packages, (see script for details)..."
npm i -g npx eslint yarn fkill firebase-tools hint jsdoc

echo "Installing ruby..."
brew install rbenv
rbenv init
update
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
rbenv install 2.6.2

echo "Installing nvm"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash
nvm install 8.4.0

echo "Install Istanbul, PhantomJS, and ImageMagick..."
brew install imagemagick@6
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/Cellar/imagemagick@6/6.9.8-3/lib/pkgconfig/:$PKG_CONFIG_PATH"
rvm use 2.4.1@global && gem install rmagick -v '2.16.0' --no-ri --no-rdoc

echo "Removing bundler and installing right version..."
gem uninstall bundler
gem install bundler:1.17.3

#!/usr/bin/env bash

# Get them creds
sudo -v

# Keep them
./utils/keepcreds.sh

# Let the user select optional applications/settings

echo "Welcome to PlusOne! This script will install some required applications and configure some settings, as well as update your OS if needed. If at any point you are required to restart your computer, please run the script again. The following applications and utilities will be installed: "
./utils/requiredApps.sh

echo "The following CAN be install if you want. If you have any questions as to what they are, ask your manager/mentor. Use your arrow keys and the spacebar to select the applications you want. Then press enter to continue."
./utils/optionalApps.sh

echo "The script will now make some changes to your system. Please do not quit the script or exit the terminal."

./osx.sh

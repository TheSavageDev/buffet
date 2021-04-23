#!/usr/bin/env bash

echo "Ensure you have a GitHub account and are part of the rwcm-norbert organization before continuing. There will be a SSH key created for you to add to your GitHub Cerner account to allow you to skip entering credentials. When prompted paste the key into the webpage that opens and save. Once completed come back here and press enter and the credentials will be tested and the repos will be cloned."

# Generate SSH Key
cd ~/.ssh
echo "Generating SSH key...please ensure the name includes 'cerner' or the script will not be able to locate the key."
echo "Enter your email address: "
read email
ssh-keygen -t rsa -b 4096 -C "$email"
eval "$(ssh-agent -s)"
rsa_options=`ls | grep cerner | awk -F'[.]' '{print $1}'`

echo "Select the correct ssh key:"

PS3="Your choice: "
QUIT="QUIT THIS PROGRAM - I feel safe now."
touch "$QUIT"

select KEY in $rsa_options;
do
  case $KEY in
    "$QUIT")
      echo "Exiting."
      break
      ;;
    *)
      echo "You picked $KEY ($REPLY)"
      rsa_name=$KEY
      break
      ;;
  esac
done
rm "$QUIT"

echo "\nHost github.cerner.com \n\
  HostName github.com \n\
  User git \n\
  AddKeysToAgent yes\n\
  UseKeychain yes\n\
  IdentityFile ~/.ssh/$rsa_name" >> ~/.ssh/config

echo $rsa_name

ssh-add -K ~/.ssh/$rsa_name

# Copy SSH Key
pbcopy < ~/.ssh/$rsa_name.pub

cd $OLDPWD

# Open GitHub SSH Keys page
echo "A page will open. Name the key and press command + v"
open https://github.cerner.com/settings/ssh/new
read -p "Press enter to continue..."

# Check Credentials
ssh -T git@github.cerner.com

# Clone Repos
cd ~ && mkdir dev && cd dev && mkdir ccm && cd ccm
# Portal
git clone git@github.cerner.rom:rwcm/rwcm-portal.git

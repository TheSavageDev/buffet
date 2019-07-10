#!/usr/bin/env bash

echo "Ensure you have a GitHub account and are part of the rwcm-norbert organization before continuing. There will be a SSH key created for you to add to your GitHub Cerner account to allow you to skip entering credentials. When prompted paste the key into the webpage that opens and save. Once completed come back here and press enter and the credentials will be tested and the repos will be cloned."

# Generate SSH Key
echo "Generating SSH key...please name it 'id_rsa_github_cerner' or it will not work"
echo "Enter your email address: "
read email
ssh-keygen -t rsa -b 4096 -C "$email"
eval "$(ssh-agent -s)"
rsa_name=`ls | grep -m1 cerner | awk -F'[.]' '{print $1}'`
echo "\nHost github.cerner.com \n\
  HostName github.com \n\
  User git \n\
  AddKeysToAgent yes\n\
  UseKeychain yes\n\
  IdentityFile ~/.ssh/$rsa_name" >> ~/.ssh/config

ssh-add -K ~/.ssh/$rsa_name

# Copy SSH Key
pbcopy < ~/.ssh/$rsa_name.pub

# Open GitHub SSH Keys page
echo "A page will open. Name the key and press command + v"
open -a 'Google Chrome' https://github.cerner.com/settings/ssh/new
read -p "Press enter to continue..."



# Check Credentials
ssh -T git@github.cerner.com

# Clone Repos
cd ~ && mkdir hbm && cd hbm
# Health Benefits Management Server
git clone git@github.cerner.com:rwcm-norbert/health_benefits_management_server.git

# Health Benefits Management Engine
git clone git@github.cerner.com:rwcm-norbert/benefits_management_engine.git

# Health Benefits Management JS
git clone git@github.cerner.com:rwcm-norbert/benefits-management-js.git

# Health Benefits Master Engine
git clone git@github.cerner.com:rwcm-norbert/health_benefits_management_engine.git

# Health Benefits Master JS
git clone git@github.cerner.com:rwcm-norbert/health-benefits-management-js.git

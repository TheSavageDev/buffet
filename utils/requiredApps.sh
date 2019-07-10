#!/usr/bin/env bash

# List the applications that are required
required=("VSCode" "git" "npm" "npx" "nvm" "Chrome" "Firefox" "Docker")

for item in "${required[@]}"
do
  echo "$item"
done

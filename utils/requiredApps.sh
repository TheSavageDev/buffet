#!/usr/bin/env bash

# List the applications that are required
required=("VSCode" "git" "nvm" "Chrome" "Firefox" "Docker")

for item in "${required[@]}"
do
  echo "$item"
done

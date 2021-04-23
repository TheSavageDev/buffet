#!/usr/bin/env bash

# Add Bookmarks to chosen Browsers

# Check for installed browsers

# Copy Recommended bookmarks to browsers

# Chrome/Canary
cp ./utils/htmlBookmarks.json ~/Library/Application\ Support/Google/Chrome/Default/Bookmarks
cp ./utils/htmlBookmarks.json ~/Library/Application\ Support/Google/Chrome\ Canary/Default/Bookmarks

# Firefox/Developer
# Tricky Need IDs
# Path is ~/Library/Application\ Support/Firefox/Profiles/[ID]/bookmarkbackups
# Could be up to three directories with multiple .jsonlz4 files


echo "Bookmarks imported"

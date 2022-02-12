#!/usr/bin/env bash

# Ask for administrator password upfront
sudo -v

# sudo keep-alive
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install xcode developer tools
xcode-select --install
sudo xcode-select -switch /Library/Developer/CommandLineTools

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/andrei/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install Brewfile contents
brew bundle

sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -license accept

sudo gem install cocoapods

# node

echo 'eval "$(fnm env)"' >> /Users/andrei/.zprofile
eval "$(fnm env)"
fnm install 16.14.0
fnm use 16.14.0

npm install -g npm
npm install -g yarn

chmod +x ./.macos
./.macos

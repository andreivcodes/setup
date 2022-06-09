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


#flutter
sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -license accept
sudo gem install cocoapods
sudo arch -x86_64 gem install ffi
flutter config --enable-macos-desktop

# node
echo 'eval "$(fnm env)"' >> /Users/andrei/.zprofile
eval "$(fnm env)"
fnm install 16
fnm use 16

npm install -g npm
npm install -g yarn

#macos preferences
chmod +x ./macos_preferences
./macos_preferences

#macos dock preferences
chmod +x ./macos_dock_preferences
./macos_dock_preferences

brew services start tmignore


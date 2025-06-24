#!/bin/bash

echo "==> Installing Rosetta (Apple Silicon only)..."
/usr/sbin/softwareupdate --install-rosetta --agree-to-license

echo "==> Installing Xcode Command Line Tools..."
xcode-select --install 2>/dev/null

echo "==> Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "==> Installing apps from Brewfile..."
brew bundle --file=~/dotfiles/macos/Brewfile

echo "==> Done! Optionally symlink dotfiles:"
# ln -s ~/dotfiles/macos/.zshrc ~/.zshrc
# ln -s ~/dotfiles/macos/.aliases ~/.aliases
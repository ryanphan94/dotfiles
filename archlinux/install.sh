#!/bin/bash
set -e

echo ">> Installing pacman packages..."
sudo pacman -Syu --needed - < pkglist.txt

echo ">> Installing AUR packages (requires yay)..."
if ! command -v yay &> /dev/null; then
  git clone https://aur.archlinux.org/yay.git && cd yay
  makepkg -si --noconfirm
  cd ..
fi

yay -S --needed - < aurlist.txt

echo ">> Symlinking config files..."
ln -sf ~/dotfiles/archlinux/.zshrc ~/.zshrc
ln -sf ~/dotfiles/archlinux/.bashrc ~/.bashrc
ln -sf ~/dotfiles/archlinux/.xinitrc ~/.xinitrc
ln -sf ~/dotfiles/archlinux/.profile ~/.profile
ln -sf ~/dotfiles/archlinux/.config ~/.config
ln -sf ~/dotfiles/archlinux/.local ~/.local

echo ">> Done!"

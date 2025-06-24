#!/bin/bash
echo "📦 Exporting current package list..."
pacman -Qqen > ~/dotfiles/archlinux/pkglist.txt
pacman -Qqem > ~/dotfiles/archlinux/aurlist.txt
echo "✅ Done."

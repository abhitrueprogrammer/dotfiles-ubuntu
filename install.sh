#!/bin/bash
pkgs='tldr git nala vlc diodon gnome-tweaks gnome-shell-extension-manager libreoffice build-essential valgrind vim'
snap_pkgs='telegram-desktop obsidian'
sudo apt update && sudo apt upgrade -y
sudo apt install -y $pkgs
sudo snap install $snap_pkgs
echo "Install chrome and vscode from their respective websites."
echo "Press enter to continue..."
read
./vscode.sh

echo "Install 'color picker' and 'vitals' from extension manager"


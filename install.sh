#!/bin/sh
pkgs='tldr git nala vlc diodon gnome-tweaks gnome-shell-extension-manager libreoffice build-essential'
sudo apt update && sudo apt upgrade -y
sudo apt install -y $pkgs
sudo snap install obsidian
echo "Please install chrome and vscode from their respective websites."


pkgs='tldr git nala vlc diodon gnome-tweaks gnome-shell-extension-manager libreoffice build-essential valgrind vim'
snap_pkgs='telegram-desktop obsidian'
sudo apt update && sudo apt upgrade -y
sudo apt install -y $pkgs
sudo snap install $snap_pkgs

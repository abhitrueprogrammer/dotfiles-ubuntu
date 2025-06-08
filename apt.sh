pkgs='tldr git nala vlc diodon gnome-tweaks gnome-shell-extension-manager libreoffice build-essential valgrind vim neofetch'
snap_pkgs='telegram-desktop obsidian datagrip'
sudo apt update && sudo apt upgrade -y
sudo apt install -y $pkgs
sudo snap install $snap_pkgs

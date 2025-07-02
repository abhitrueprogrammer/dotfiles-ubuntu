pkgs='tldr git nala vlc diodon gnome-tweaks gnome-shell-extension-manager libreoffice build-essential valgrind vim neofetch kitty snapd'
snap_pkgs='telegram-desktop obsidian datagrip nvim'
sudo apt update && sudo apt upgrade -y
sudo apt install -y $pkgs
sudo snap install $snap_pkgs
./docker.sh

# Check if ~/.vimrc does not exist
if [ ! -e "$HOME/.vimrc" ]; then
  mv "./settings/.vimrc" "$HOME/.vimrc"
  echo "Moved vimrc."
else
  echo "vimrc already exists, skipping move"
fi

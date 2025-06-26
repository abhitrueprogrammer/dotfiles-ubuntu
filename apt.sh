pkgs='tldr git nala vlc diodon gnome-tweaks gnome-shell-extension-manager libreoffice build-essential valgrind vim neofetch'
snap_pkgs='telegram-desktop obsidian datagrip'
sudo apt update && sudo apt upgrade -y
sudo apt install -y $pkgs
sudo snap install $snap_pkgs

# Check if ~/.vimrc does not exist
if [ ! -e "$HOME/.vimrc" ]; then
  mv "./settings/.vimrc" "$HOME/.vimrc"
  echo "Moved vimrc."
else
  echo "vimrc already exists, skipping move"
fi
./docker.sh

echo "Do you want to install and setup lazyvim? (Y/n)"
read
if [ "$input" == "y" ] || [ "$input" == "Y" ] || [ -z "$input" ]; then
  snap install nvim
  sudo apt install kitty
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  rm -rf ~/.config/nvim/.git
  mkdir $HOME/.fonts
  mv "./settings/JetBrainsMonoNerdFont-Regular.ttf" $HOME/.fonts
  fc-cache -fv
else
  echo "Skipping installation of neovim."
fi

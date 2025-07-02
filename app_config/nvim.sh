git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
mkdir $HOME/.fonts
cp -n "../settings/JetBrainsMonoNerdFont-Regular.ttf" $HOME/.fonts
fc-cache -fv

if ! command -v nvim &>/dev/null; then
  echo "Neovim (nvim) is not installed. Install using appropriate method."
fi

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
mkdir $HOME/.fonts
cp -n "../settings/JetBrainsMonoNerdFont-Regular.ttf" $HOME/.fonts
fc-cache -fv

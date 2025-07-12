sudo swapoff /swap.img
mv /swap.img $HOME/swap.backup
echo "please delete swap.backup from ~/swap.backup once everything starts working fine "
sudo mkswap -U clear --size 8G --file /swap.img
sudo swapon /swap.img

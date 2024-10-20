ssh_location="/home/$USER/.ssh/id_ed25519.pub"

git config --global user.name "abhitrueprogrammer"
git config --global user.email "abhiaruvs3@gmail.com"
git config --global init.defaultBranch main

if [ -f $ssh_location ]; then
    echo "ssh file already exists"
else
    ssh-keygen -t ed25519 -C "abhiaruvs3@gmail.com"
fi
cat ~/.ssh/id_ed25519.pub 
echo "Copy the output from 'ssh-ed255' to '.com'
Add SSH key to github [https://github.com/settings/keys]"
echo "Press enter to continue..."
read
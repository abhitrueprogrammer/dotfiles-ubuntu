ssh_location="/home/$USER/.ssh/id_ed25519.pub"

current_name=$(git config --global --get user.name)
if [ -z "$current_name" ]; then
    echo "Please enter your FULL NAME for Git configuration:"
    read git_user_name
    git config --global user.name "$git_user_name"
    echo "Git user.name has been set to $git_user_name"
else
    echo "Git user.name is already set to '$current_name'. Skipping configuration."
fi

current_email=$(git config --global --get user.email)
if [ -z "$current_email" ]; then
    echo "Please enter your EMAIL for Git configuration:"
    read git_user_email
    git config --global user.email "$git_user_email"
    echo "Git user.email has been set to $git_user_email"
else
    echo "Git user.email is already set to '$current_email'. Skipping configuration."
fi

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

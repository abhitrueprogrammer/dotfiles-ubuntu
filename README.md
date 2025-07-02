A pc setup automation utility that installs apps, setups common apps and asks user intervention wherever required, to make setting up a linux machine as convinient as possible. 

# Installation instruction: 
1. Download the archieve and cd into its folder:
   - Using CURL
     ```sh
        mkdir -p dotfiles-ubuntu \
      && curl -L https://github.com/abhitrueprogrammer/dotfiles-ubuntu/archive/refs/heads/main.tar.gz \
         | tar -xz --strip-components=1 -C dotfiles-ubuntu \
      && cd dotfiles-ubuntu
     ```
   - Or if you have git:
     ```sh
     git clone https://github.com/abhitrueprogrammer/dotfiles-ubuntu.git
     cd dotfiles-ubuntu
     ```
2. Make the install script runnable and run it:
   ```sh
   chmod +x ./install.sh
   ./install.sh
   ```

## Flow
1. Asks user to questions and complete initial setup. 
2. Installs packages through apt and snap
3. Sets up git
4. Sets up folder structure
5. Sets up gnome settings
6. Sets up VSCode extensions and optionally settings and keyboard shortcuts
7. Installs neovim
8. Installs docker
9. Installs fish
10. Asks user to install gnome extension
11. Asks user install chrome and run script to install zen beta

# Contribution guidelines:
1. Feel free to fork this project and make it your own.
2. Contributing through pull requests is enouraged. Note that I won't be accepting PRs that just installs a new package, at least in the main branch, as this is highly personalised for my specific needs. Create an issue for the potential PR first if you are unsure.

# TODO:
[ x ] Put fish install

[ ] Install fnm and default node with it

[ x ] Put zen install in addition to chrome

[ x ] Put vim dot file

[ x ] Snap install nvim and install latest lazyvim

[ x ] Update vscode extensions

[ x ] (kinda did this with nextJS like install) Put a --default option to have a hands free experience

[ x ] Install docker

[ x ] Put installation of application configs(vim, docker, fish, vscode, zen) in separate folder

[ ] Detect if snaps are installed else try out installing flatpak

[ x ] Create file structure with git, code, temp, ubuntu-dotfiles and documents/obsidian, documents/form

[ x ] wakapi 

[ x ] Get obsidian from web after github signin 

# LONGTERM: 
[ ] Make this UNIX compatible (both for linux and macos)

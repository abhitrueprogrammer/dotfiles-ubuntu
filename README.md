A pc setup automation utility that installs apps, setups common apps and asks user intervention wherever required, to make setting up a linux machine as convinient as possible. 

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

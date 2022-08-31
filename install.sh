#!/bin/zsh

# Please be gentle, this is my first script
# This script executes the set of instructions outlined in the README

# First we install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


# Next we clone and set the MIN_SETUP variable
git clone https://github.com/Benni-Math/min-mac-setup.git ~/Downloads/min-mac-setup/

MIN_SETUP=${MIN_SETUP:-"~/Downloads/min-mac-setup"}

# Copy Git configuration files to $HOME
cp $MIN_SETUP/.gitconfig ~/.gitconfig
cp $MIN_SETUP.gitignore ~/.gitignore


# Install iTerm2
brew install --cask iterm2

# Install fonts
cp $MIN_SETUP/fonts/Hack-Regular.ttf ~/Library/Fonts/
cp $MIN_SETUP/fonts/PowerlineSymbols.otf ~/Library/Fonts/

# Create min-iterm2 profile
cp $MIN_SETUP/min-iterm2.json ~/Library/Application\ Support/iTerm2/DynamicProfiles/min-iterm2.json

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# Setup .zshrc
cp $MIN_SETUP/.zshrc ~/.zshrc
source ~/.zshrc

# Vim 
cp -R $MIN_SETUP/.vim ~/.vim
vim -u NONE -c "helptags vim-gitgutter/doc" -c q
cp $MIN_SETUP/.vimrc ~/.vimrc

# tmux
git clone https://github.com/gpakosz/.tmux.git $MIN_SETUP/oh-my-tmux
ln -s -f $MIN_SETUP/oh-my-tmux/.tmux.conf ~/.tmux.conf 
cp $MIN_SETUP/.tmux.conf.local ~/.tmux.conf.local

# Remind user of manual steps
echo "Don't forget to set your GH username and email in .gitconfig."
echo "Don't forget to set your iTerm2 Profile and Minimal Appearance."
echo "\nOther CLI Tools: ripgrep & locate (see $MIN_SETUP/README.md)"

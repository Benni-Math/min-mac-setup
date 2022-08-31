# Path to your oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Change this to whatever you like!
ZSH_THEME="agnoster"

# If you don't want the user@hostname to show up
# DEFAULT_USER=<insert_username>
# prompt_context(){}

plugins=(
    git
    zsh-autosuggestions
    web-search
    copypath
    copyfile
    tmux
    history
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Compilation flags
# export ARCHFLAGS="-arch aarch64"

# File commands
alias l="ls -lFh"
alias ll="ls -la"
alias lt="lt -ltFh"

# Find commands
alias fd="find . -type d -name"
alias ff="find . -type f -name"

# Safety commands
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# Git commands
alias g="git"
alias gcl="git clone"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gps="git push"
alias gpsu="gps -u origin"
alias gf="git fetch"
alias gba="git branch -a"
alias gpl="git pull"
alias gco="git checkout"
alias gr="git rebase"
alias gm="git merge"
alias glg="git lg2"

# Quickly setting zsh settings
alias config="vim ~/.zshrc"
alias src="source ~/.zshrc"

# Set default editor
export EDITOR="vim"

# Adding ~/.local to PATH 
# export PATH="$PATH:~/.local"

# Add VSCode
# export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Access to nvm
# source $(brew --prefix nvm)/nvm.sh

# Add more stuff here:

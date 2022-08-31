# Ben's Minimal Mac Setup

##TODO:
 - test the install script

This is a guide for getting a bare-bones Vim-based setup going on a Mac for software development.
This may not be ideal for full on development, since there is no code analysis or GUI,
but this is enough for me to quickly get started - if other tools are required they can added when needed.

The only **prerequisite** for this setup is an Apple computer with MacOS and `curl` (already on Mac).

If you're extra lazy, this guide is setup so that you can just download the 'run-setup' script 
and just run it. This can be done entirely from the command line, like so:
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Benni-Math/min-mac-setup/install.sh)"
```
and then you just need to go to iTerm2 Preferences/Appearance and change Theme to 'Minimal',
next go to Iterm2 Preferences/Profiles and select 'min-iterm2',
and then finally insert GitHub and AWS account information.

For those who want to do this manually or want to customize the setup, you can follow along with the guide.

## Table of Contents
 - [Homebrew](#homebrew)
 - [iTerm2](#iterm2)
 - [Oh-My-ZSH](#oh-my-zsh)
 - [Vim](#vim)
    - [NeoVim](#neovim)
 - [tmux](#tmux)
 - [More CLI Tools](#more-cli-tools)
 - [Other Tools](#other-tools)
    - [AWS CLI](#aws-cli) [Docker](#docker)
    - [Programming Languages](#programming-languages)
    - [Code Analysis](#code-analysis)
 - [Alias Glossary](#alias-glossary)


## Homebrew

The first step is to download a package manager, and the de-facto choice for MacOS install
[Homebrew](https://brew.sh) which we install with
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
This will also install the [XCode Developer Tools](https://developer.apple.com/xcode/features/),
meaning that it will also install the most important developer tool out there: [**Git**](https://git-scm.com).

Now that we have Git, we can clone down this repository:
```
git clone https://github.com/Benni-Math/min-mac-setup.git ~/Downloads/min-mac-setup/
export MIN_SETUP="~/Downloads/min-mac-setup"
```
(Note: you don't need to clone into the Downloads folder.)

Let's quickly go over the [`.gitcongif`](./.gitcongif) and [`.gitignore`](./.gitignore) files.
For the gitconfig, we essentially just set email and username, corresponding to [GitHub](https://github.com) accounts,
and then we set the 'global' gitignore (so, files that are ignored in every git repository)
and a set of aliases for prettier `git log` printing.
The `.gitignore` sets global ignores for `*.swp` files (Vim swap) and the MacOS specific `.DS_STORE`.
Copy those over to your $HOME:
```
cp $MIN_SETUP/.gitconfig ~/.gitconfig
cp $MIN_SETUP.gitignore ~/.gitignore
```
and the insert your GitHub information in `.gitconfig`. Here is where we really start to get going on the setup!

## iTerm2

Download iTerm2 with
```
brew install --cask iterm2
```

Install the fonts (or pick your own):
```
cp $MIN_SETUP/fonts/Hack-Regular.ttf ~/Library/Fonts/
cp $MIN_SETUP/fonts/PowerlineSymbols.otf ~/Library/Fonts/
```

and then change copy the `min-iter.json` file into `iTerm2`'s Dynamic Profile folder:
```
cp $MIN_SETUP/min-iterm2.json ~/Library/Application\ Support/iTerm2/DynamicProfiles/min-iterm2.json
```

Next up, the only non-command line portion, you need to open iTerm2, open Preferences, and:
 - change Appearance/Theme to 'Minimal'
 - change Profiles to 'min-iterm2'

For the rest of the stuff, you can run the commands through iTerm2.

## Oh-My-ZSH

ZSH is the base shell for MacOS (as of writing this), and to extend its potential I use [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh),
which you can download with
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Next, we download the [zsh-autosuggestion](https://github.com/zsh-users/zsh-autosuggestions) plugin with
```
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
```

Then, we copy copy and set the `.zshrc`
```
cp $MIN_SETUP/.zshrc ~/.zshrc
source ~/.zshrc
```

## Vim

Vim is already installed, but we need to add the [NeoSolarized](https://github.com/overcache/NeoSolarized) color theme
and the [gitgutter](https://github.com/airblade/vim-gitgutter) extension, 
which we just copy over and activate:
```
cp -R $MIN_SETUP/.vim ~/.vim
vim -u NONE -c "helptags vim-gitgutter/doc" -c q
```

Then, we copy over the config files:
```
cp $MIN_SETUP/.vimrc ~/.vimrc
```

### NeoVim

Since this is a minimal setup, we won't get into NeoVim, but if you want to 
beef up your editor while maintaining the Vim feel, I recommend looking into
some other tutorials, like this one by 
[devaslife](https://blog.inkdrop.app/how-to-set-up-neovim-0-5-modern-plugins-lsp-treesitter-etc-542c3d9c9887)
or any other '.nvim' repos shared by people on 'r/NeoVim' or whatever.

## tmux

The final core command-line tool is [tmux](https://github.com/tmux/tmux/wiki), for which I use a pre-made setup 
(with some added commands) from [oh-my-tmux](https://github.com/gpakosz/.tmux). So, we run the following commands:
```
git clone https://github.com/gpakosz/.tmux.git $MIN_SETUP/oh-my-tmux
ln -s -f $MIN_SETUP/oh-my-tmux/.tmux.conf ~/.tmux.conf 
```

and then copy the local tmux configurations from this repo:
```
cp $MIN_SETUP/.tmux.conf.local ~/.tmux.conf.local
```

## More CLI tools

I also like to use [ripgrep](https://github.com/BurntSushi/ripgrep), which I download with
```
brew install ripgrep
```

and then I activate the 'locate' utility which is built into Macs:
```
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist
```

## Other Tools

For specific projects, these following tools are useful.

### AWS CLI

Ever heard of microservices, cloud computing, serverless, or any other number of hot, new buzzwords?
AWS is the cloud service that I most actively use, and so I usually like to 
```
brew install awscli
```
and then:
```
cp -R $MIN_SETUP/.aws ~/.aws
```
followed by setting your credentials in `~/.aws/credentials`.

There are other tools which are helpful alongside this, like `cloudsentry` for managing credentials.

### Docker

Docker is a widely used containerization service, and it can be easily installed with
```
brew install --cask docker
```
*Note*: this will install the Docker Desktop application.

#### Alternatives to Docker

Docker can be pretty heavy duty.

If you don't want to use Docker, there are other open-source options that can be found at 
[OCI](https://github.com/opencontainers).

### Programming Languages

Many compilers, interpreters, standard libraries, and other tools required for developing with specific
programming languages can be simply downloaded by first checking `brew search <name>`, 
but here is some advice for languages where we want to do something a little different or more involved.

#### Rust

Make sure to use rustup ([reason](https://users.rust-lang.org/t/best-way-to-install-rust-on-os-x-rustup-or-brew/6362jk)), 
which you can download with this command 
`curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`;

I also highly recommend downloading [rust-analyzer](https://rust-analyzer.github.io) with `brew install rust-analyzer`

#### JavaScript / TypeScript

For web development, we need Javascript (or TypesScript). This requires some sort of JS runtime (Node, Deno, Bun)
and a package manager (NPM, Yarn, pnmp)

#### Python

For Python development, there are also many choices. (should I pick Anaconda or pip?)

### Code Analysis

For Vim, I use [coc](https://github.com/neoclide/coc.nvim) (config files not here).

To allow for code analysis, I would recommend the use of either NeoVim with [lsp-config]()
(for those that are okay with extra setup work for customization)
or VSCode with all of its extensions (or possibly a JetBrains IDE if you need something heavy duty).

### etc.

For other tools, usually the best first step is to simply try `brew search <tool>`
or if that fails `google <tool>`.

For example, if you prefer VSCode over (Neo)Vim, then a quick `brew search` gives us that you should try
`brew install --cask visual-studio-code`.

## Alias Glossary

If you type in the command `alias`, you can see that there are tons of aliases built into this setup.
Here is a summary:

*Insert table here*

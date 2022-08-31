# Ben's Minimal Mac Setup

This is a guide for getting a bare-bones Vim-based setup going on a Mac for software development.
This may not be ideal for full on development, since there is no code analysis or GUI,
but this is enough for me to quickly get started - if other tools are required they can added when needed.

If you're extra lazy, this guide is setup so that you can just download the 'run-setup' script 
and just run it. This can be done entirely from the command line, like so:
```
curl

./run-setup.sh
```
and then you just need to insert GitHub and AWS account information.

For those who are skeptical, the `run-setup.sh` file does the following:
 - copy all the dotfiles (except `.git`) into your `$HOME`, also known as `~`, directory
 - and then just running all of the code-blocks to download all of the tools

## Table of Contents
 - [Homebrew](#homebrew)
 - [iTerm2](#iterm2)
 - [Oh-My-ZSH](#oh-my-zsh)
 - [Vim](#vim)
    - [NeoVim](#neovim)
 - [tmux](#tmux)
 - [Other Tools](#other-tools)
    - [AWS CLI](#aws-cli) [Docker](#docker)
    - [Programming Languages](#programming-languages)
    - [Code Analysis](#code-analysis)


## Homebrew

The first step is to download a package manager, and the de-facto choice for MacOS install
[Homebrew](https://brew.sh) which we install with
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
This will also install the [XCode Developer Tools](https://developer.apple.com/xcode/features/),
meaning that it will also install the most important developer tool out there: [**Git**](https://git-scm.com).

Let's quickly go over the [`.gitcongif`](./.gitcongif) and [`.gitignore`](./.gitignore) files.
For the gitconfig, we essentially just set email and username, corresponding to [GitHub](https://github.com) accounts,
and then we set the 'global' gitignore (so, files that are ignored in every git repository) and the

## iTerm2

## Oh-My-ZSH

## Vim

### NeoVim

## tmux

## Other Tools

### AWS CLI

### Docker

#### Alternatives to Docker

If you don't want to use Docker, there are other open-source options that can be found at 
[OCI](https://github.com/opencontainers)

### Programming Languages

Many compilers, interpreters, standard libraries, and other tools required for developing with specific
programming languages can be simply downloaded by first checking `brew insta`

#### Rust

Make sure to use rustup ([reason](https://users.rust-lang.org/t/best-way-to-install-rust-on-os-x-rustup-or-brew/6362jk)), 
which you can download with this command 
`curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`;

I also highly recommend downloading [rust-analyzer](https://rust-analyzer.github.io) with `brew install rust-analyzer`

#### JavaScript / TypeScript

For web development, we need Javascript (or TypesScript). This requires some sort of JS runtime (Node, Deno, Bun)
and a package manager (NPM, Yarn, pnmp)

### Code Analysis

To allow for code analysis, I would recommend the use of either NeoVim with [lsp-config]()
or VSCode with all of its extensions (or possibly a JetBrains IDE if you need something heavy duty).

For Vim, we will be using [coc](https://github.com/neoclide/coc.nvim).

## etc.

For other tools, usually the best first step is to simply try `brew search <tool>`
or if that fails `google <tool>`.

For example, if you prefer VSCode over (Neo)Vim, then a quick `brew search` gives us that you should try
`brew install --cask vscode`.

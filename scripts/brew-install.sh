#!/bin/bash

set -euo pipefail

# bare essentials
brew install \
  git \
  zsh \
  tmux \
  python3 \
  neovim \
  rg \
  fzf \
  zsh-syntax-highlighting \
  zsh-autosuggestions \
  reattach-to-user-namespace

# python3 pip modules
python3 -m pip install pynvim

# casks
brew cask install \
	docker \
	iterm2 \
	slack \
	spotify \
	google-cloud-sdk \
	dropbox \
	tunnelblick \
	1password \
	telegram \
	google-chrome \
	firefox \
	google-drive-file-stream \
	brave-browser \
	superhuman \
	fantastical \
	alfred

# nerd-fonts
brew tap homebrew/cask-fonts
brew cask install font-sourcecodepro-nerd-font-mono

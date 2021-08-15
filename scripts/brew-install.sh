#!/bin/bash

set -euo pipefail

# bare essentials
brew install \
  git \
  zsh \
  tmux \
  python3 \
  node \
  neovim \
  rg \
  fzf \
  cocoapods \
  zsh-syntax-highlighting \
  zsh-autosuggestions \
  reattach-to-user-namespace \
  broot \
  zoxide \
  gh \
  git-delta

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
	arq \
	google-chrome \
	firefox \
	google-drive-file-stream \
	brave-browser \
	superhuman \
	fantastical \
	bartender \
	geekbench \
	little-snitch \
	hazel \
	rescuetime \
	teamviewer \
	keyboard-maestro \
	alfred \
	alacritty \
	amethyst

# nerd-fonts
brew tap homebrew/cask-fonts
brew cask install font-sourcecodepro-nerd-font-mono

# mcfly
brew tap cantino/mcfly
brew install mcfly

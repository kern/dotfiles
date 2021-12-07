.PHONY: install

CWD := $(shell pwd)

install:
	mkdir -p ~/.config
	mkdir -p ~/.config/alacritty
	- ln -Fis $(CWD)/nvim ~/.config
	- ln -is $(CWD)/zsh/zshrc ~/.zshrc
	- ln -is $(CWD)/other/hushlogin ~/.hushlogin
	- ln -is $(CWD)/git/gitignore ~/.gitignore
	- ln -is $(CWD)/git/gitconfig ~/.gitconfig
	- ln -is $(CWD)/tmux/tmux.conf ~/.tmux.conf
	- ln -is $(CWD)/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
	- ln -is $(CWD)/alacritty/base16-monokai.yml ~/.config/alacritty/base16-monokai.yml
	- git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
	- $(CURDIR)/scripts/macos-defaults.sh
	- $(CURDIR)/scripts/brew-install.sh
	- $(CURDIR)/scripts/go-install.sh

.PHONY: install

CWD := $(shell pwd)

install:
	mkdir -p ~/.config
	- ln -Fis $(CWD)/nvim ~/.config
	- ln -is $(CWD)/zsh/zshrc ~/.zshrc
	- ln -is $(CWD)/other/hushlogin ~/.hushlogin
	- ln -is $(CWD)/git/gitignore ~/.gitignore
	- ln -is $(CWD)/git/gitconfig ~/.gitconfig
	- ln -is $(CWD)/tmux/tmux.conf ~/.tmux.conf
	- git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

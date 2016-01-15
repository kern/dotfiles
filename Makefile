.PHONY: install

CWD := $(shell pwd)

install:
	mkdir -p ~/.config
	- ln -Fis $(CWD)/nvim ~/.config
	- ln -Fis $(CWD)/fish ~/.config
	- ln -is $(CWD)/other/hushlogin ~/.hushlogin
	- ln -is $(CWD)/git/gitignore ~/.gitignore
	- ln -is $(CWD)/git/gitconfig ~/.gitconfig
	- ln -is $(CWD)/tmux/tmux.conf ~/.tmux.conf

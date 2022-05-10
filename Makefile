CWD := $(shell pwd)

.PHONY: install
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

.PHONY: install/listen-on-camera
install/listen-on-camera:
	- mkdir -p ~/Library/Kern.io
	- mkdir -p ~/Library/LaunchAgents
	- ln -is $(CWD)/automation/io.kern.listen-on-camera.plist ~/Library/LaunchAgents/io.kern.listen-on-camera.plist
	- launchctl load ~/Library/LaunchAgents/io.kern.listen-on-camera.plist

.PHONY: install/listen-on-camera/upload
install/listen-on-camera/unload:
	- launchctl unload ~/Library/LaunchAgents/io.kern.listen-on-camera.plist

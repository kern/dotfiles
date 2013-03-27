curl -L https://get.rvm.io | bash -s stable --ruby
ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
brew install zsh
echo "echo /usr/local/bin/zsh >> /etc/shells" | sudo bash
chsh -s /usr/local/bin/zsh
cd ~/.dotfiles
git submodule init
git submodule update

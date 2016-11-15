# general
set HOMEBREW "/usr/local"
set EDITOR neovim
set fish_greeting ""

# base16
if status --is-interactive
  eval sh $HOME/.config/base16-shell/scripts/base16-tomorrow-night.sh
end

# env
set PATH $HOME/.dotfiles/bin $PATH
set -g -x PAVLOV_HOME $HOME/Pavlov
set -g -x CXXFLAGS "-I$HOMEBREW/include"
set -g -x LDFLAGS "-L$HOMEBREW/lib"
set -g -x PAGER vimpager

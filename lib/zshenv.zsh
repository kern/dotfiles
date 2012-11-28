export DOTFILES=~/.dotfiles
export DOTFILESBIN=$DOTFILES/bin
export DOTFILESLIB=$DOTFILES/lib
export DOTFILESPLUGIN=$DOTFILES/plugin
export DOTFILESCONFIG=$DOTFILES/config
export DOTFILESGLOBALCONFIG=$DOTFILESCONFIG/global
export DOTFILESINTERACTIVECONFIG=$DOTFILESCONFIG/interactive
export DOTFILESFUNCTIONSCONFIG=$DOTFILESCONFIG/functions

fpath=($DOTFILESFUNCTIONSCONFIG $fpath)
autoload -U $DOTFILESFUNCTIONSCONFIG/*(:t)

function source_directory() {
  for source_file ($1/**/*.zsh) source $source_file
}

source $DOTFILESLIB/path_helpers.zsh
source_directory $DOTFILESGLOBALCONFIG

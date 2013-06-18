function append_to_path() {
  export PATH="$PATH:$1"
}

function prepend_to_path() {
  export PATH="$1:$PATH"
}

prepend_to_path $DOTFILES_BIN
prepend_to_path /usr/local/share/python

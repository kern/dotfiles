# Appends a directory to the PATH.
function append_to_path() {
  export PATH="$PATH:$1"
}

# Prepends a directory to the PATH.
function prepend_to_path() {
  export PATH="$1:$PATH"
}

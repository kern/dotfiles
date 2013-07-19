autoload colors && colors

prompt_directory_name() {
  echo "%1/%\/"
}

export PROMPT=$'$(prompt_directory_name) %{$fg[cyan]%}$%{$reset_color%} '

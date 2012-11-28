autoload colors && colors

prompt_directory_name() {
  echo "%{$fg_bold[blue]%}%1/%\/%{$reset_color%}"
}

export PROMPT=$'$(prompt_directory_name) $ ''$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

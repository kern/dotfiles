setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt NO_LIST_BEEP

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' insert-tab pending%                                                                                                                                                                  

autoload -U compinit
compinit

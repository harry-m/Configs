# Environment
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Load stuff
autoload -Uz vcs_info
autoload -Uz compinit

# Zsh settings
setopt appendhistory autocd notify promptsubst
unsetopt beep nomatch
bindkey -e

# ctrl-left and ctrl-right
bindkey ";5C" forward-word
bindkey ";5D" backward-word

# Enable autocompletion
compinit
 
# Prompt
zstyle ':vcs_info:*' disable bzr # gratuitously slow
zstyle ':vcs_info:*' formats ' [%b]'
precmd() { vcs_info }

export PS1='%D{%H:%M} %n@%m:%~${vcs_info_msg_0}%# '

# Aliases and old bash stuff
source ~/.myrc

# Funky zsh-style aliasfunction magic
mdc() { mkdir -p "$1" && cd "$1" }

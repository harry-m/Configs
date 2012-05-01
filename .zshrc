# Environment
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
EDITOR=vim
VISUAL=vim

# Autocompletion
autoload -Uz compinit && compinit

# Colors
autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
  colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
    eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
done
PR_NO_COLOUR="%{$terminfo[sgr0]%}"

# Zsh settings
setopt appendhistory autocd notify promptsubst
unsetopt beep nomatch
bindkey -e

# ctrl-left and ctrl-right
bindkey ";5C" forward-word
bindkey ";5D" backward-word
bindkey "$terminfo[khome]" beginning-of-line
bindkey "$terminfo[kend]" end-of-line
bindkey "^[[3~" delete-char

# Prompt

## Git stuffs
autoload -Uz vcs_info

zstyle ':vcs_info:*' disable bzr # gratuitously slow
zstyle ':vcs_info:*' formats ' [%b]'
function precmd () { 
  vcs_info 
}

commandline=''

## TSocks?
if [[ $LD_PRELOAD == *libtsocks.so* ]]; then
  commandline="$commandline$PR_GREEN""[tsocks]$PR_NO_COLOUR "
fi

## The time
commandline="$commandline$PR_LIGHT_BLUE%T$PR_NO_COLOUR "

## Root?
if [[ $UID -eq 0 ]]; then
  commandline="$commandline$PR_RED"
fi

## User/host
commandline="$commandline%n@%m"

## Root?
if [[ $UID -eq 0 ]]; then
  commandline="$commandline$PR_NO_COLOUR"
fi


## Git stuff
if [[ $EUID -ne 0 ]]; then
  commandline="$commandline$PR_LIGHT_MAGENTA\$vcs_info_msg_0_$PR_NO_COLOUR"
fi

## Path
commandline="$commandline:%~"

## Prompt char
commandline="$commandline%# "

export PS1=$commandline

alias wget='wget -erobots=off --no-check-certificate'
alias time="command time -f '%C real %e user %U sys %S'"
alias tidy="tidy -i"
alias ls="ls --color"
alias ll="ls -la"
alias llh="ls -lah"

# Start dotjs
#/home/harry/bin/djsd -d

# Funky zsh aliasfunction magic
mcd() { mkdir -p "$1" && cd "$1" }

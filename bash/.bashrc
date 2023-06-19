if [[ -f "~/.bashrc.local" ]]; then
    source ~/.bashrc.local
fi

alias 'll=ls -ltra '

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias grep='grep --color'
alias ll='ls -ltra'
alias ls='ls -F --color'

export HISTSIZE=10000
export HISTFILESIZE=120000

#export HISTCONTROL=erasedups:ignoredups:ignorespace
shopt -s checkwinsize
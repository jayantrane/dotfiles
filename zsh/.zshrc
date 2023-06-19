if [[ -f "~/.zshrc.local" ]]; then
    source ~/.zshrc.local
fi

HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000000
SAVEHIST=$HISTSIZE

source ~/dotfiles/zsh/aliases.zsh

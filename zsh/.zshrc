if [[ -f "~/.zshrc.local" ]]; then
    source ~/.zshrc.local
fi

HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000000
SAVEHIST=$HISTSIZE

if [[ -f "~/dotfiles/zsh/aliases.zsh" ]]; then
    source ~/dotfiles/zsh/aliases.zsh
fi

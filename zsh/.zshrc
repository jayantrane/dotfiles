DOTFILES_DIR=~/dotfiles

if [[ -f "~/.zshrc.local" ]]; then
    source ~/.zshrc.local
fi

source $DOTFILES_DIR/common/aliases

HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000000
SAVEHIST=$HISTSIZE

if [[ -f "~/dotfiles/zsh/aliases.zsh" ]]; then
    source ~/dotfiles/zsh/aliases.zsh
fi

if [[ -f "~/dotfiles/zsh/options.zsh" ]]; then
    source ~/dotfiles/zsh/options.zsh
fi

# Prompt for now
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT='%F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '
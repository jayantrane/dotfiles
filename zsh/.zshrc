source $HOME/dotfiles/common/env

if [[ -f "$HOME/.zshrc.local" ]]; then
    source $HOME/.zshrc.local
fi

source $DOTFILES_DIR/common/aliases
source $DOTFILES_DIR/zsh/options.zsh
source $DOTFILES_DIR/zsh/plugins.zsh

HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000000
SAVEHIST=$HISTSIZE

# Prompt for now
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT='%F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '

# Auto completion
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=green,bold,underline"
bindkey '^ ' autosuggest-accept
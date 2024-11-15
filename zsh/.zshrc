# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#000000,bg=#85dcff,underline"
bindkey '^ ' autosuggest-accept  # CTRL + Space to accept the suggestion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Add prettified git logs

HASH="%C(always,yellow)%h%C(always,reset)"
RELATIVE_TIME="%C(always,green)%ar%C(always,reset)"
AUTHOR="%C(always,bold blue)%an%C(always,reset)"
REFS="%C(always,red)%d%C(always,reset)"
SUBJECT="%s"

FORMAT="$HASH $RELATIVE_TIME{$AUTHOR{$REFS $SUBJECT"

pretty_git_log() {
git log --graph --pretty="tformat:$FORMAT" $* |
column -t -s '{' |
less -XRS --quit-if-one-screen
}

alias gll='pretty_git_log'

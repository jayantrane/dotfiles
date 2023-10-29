#!/bin/bash
if [[ -f ~/.bashrc ]]; then 
    mv ~/.bashrc ~/.bashrc.local
fi
ln -s ~/dotfiles/bash/.bashrc ~/.bashrc

if [[ -f ~/.zsh ]]; then
    mv ~/.zshrc ~/.zshrc.local
fi
ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc

if [[ -f ~/.tmux.conf ]]; then 
    mv ~/.tmux.conf ~/.tmux.conf.local
fi
ln -s ~/dotfiles/tumx/.tmux.conf ~/.tmux.conf

# VS Code paths
# Windows %APPDATA%\Code\User\settings.json
# macOS $HOME/Library/Application\ Support/Code/User/settings.json
# Linux $HOME/.config/Code/User/settings.json
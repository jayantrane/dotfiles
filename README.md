# dotfiles
Jayant's configs for environment setup.

## For Tmux, install the TPM as per follows:
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

### And reload config or run following
run '~/.tmux/plugins/tpm/tpm'

## Zsh

This configuration uses `zsh` as the default shell, enhanced with several plugins and custom settings for a more productive workflow.

### Features

- **Plugin Manager**: Uses [Antigen](https://github.com/zsh-users/antigen) to manage plugins.
- **Prompt**: Styled with [Powerlevel10k](https://github.com/romkatv/powerlevel10k) for a fast and informative prompt, including git status.
- **Auto-suggestions**: [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) suggests commands as you type based on your history.
- **Syntax Highlighting**: [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) provides real-time highlighting for commands.
- **Fuzzy Search**: Integrated with [fzf](https://github.com/junegunn/fzf) for powerful fuzzy searching capabilities.
- **Aliases**: Custom aliases are defined in `common/aliases`.
- **Git Log**: A custom, prettified git log is available via the `gll` alias.

### Keybindings

| Keybinding      | Description                                           |
| --------------- | ----------------------------------------------------- |
| `Ctrl + Space`  | Accept the current suggestion from `zsh-autosuggestions`. |
| `Ctrl + R`      | Invoke `fzf` to fuzzy-search through command history.   |
| `Ctrl + T`      | Invoke `fzf` to fuzzy-search for files and directories. |
| `Alt + C`       | Invoke `fzf` to fuzzy-search for a directory and `cd` into it. |


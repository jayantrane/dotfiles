# dotfiles
Jayant's configs for environment setup.

## Tmux

The tmux config lives in `tmux/.tmux.conf`. The prefix is remapped to `Ctrl-s` (from the default `Ctrl-b`), so every shortcut in the tables below is pressed as `prefix` then the key (for example, reload is `Ctrl-s` then `r`).

### Install

Install the Tmux Plugin Manager (TPM), then reload the config so it can fetch the plugins:

```
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source-file ~/.tmux.conf
```

Inside a tmux session press `prefix + I` to install the plugins listed in the config, and `prefix + U` to update them later.

### Keybindings

| Key (after prefix `C-s`) | Action |
| ------------------------ | ------ |
| `r`                      | Reload `~/.tmux.conf`. |
| `h` / `j` / `k` / `l`    | Move to the pane on the left / below / above / right. |
| `c`                      | New window, opened in the current pane's directory. |
| `"`                      | Split top/bottom, in the current pane's directory. |
| `%`                      | Split left/right, in the current pane's directory. |
| `C-o`                    | Save the current pane's full scrollback to `~/tmp/tmux.output`. |
| `P`                      | Prompt "plugin:" and list the installed TPM plugins. |
| `C-f`                    | Launch the tmux-fzf fuzzy finder (set via `@fzf-launch`). |
| `Tab`                    | Extrakto: fuzzy-extract text, paths, and git hashes from the pane (plugin default). |
| `I` / `U`                | TPM: install / update plugins (plugin defaults). |

Copy mode (vi keys are enabled):

| Key (in copy mode) | Action |
| ------------------ | ------ |
| `y`                | Copy the selection to the system clipboard via `xclip`. |

### Behavior and settings

| Setting | Value / effect |
| ------- | -------------- |
| Prefix | `Ctrl-s` (default `Ctrl-b` is unbound). |
| Scrollback history | 100,000 lines per pane. |
| Mouse | On: click to select panes/windows, drag borders to resize, scroll to page back. |
| System clipboard | On (`set-clipboard`), so copied text reaches the OS clipboard. |
| Window/pane numbering | Starts at 1 (not 0). |
| Window names | Fixed: `automatic-rename` and `allow-rename` are off, so manually set names persist. |
| New windows/splits | Inherit the current pane's directory rather than the session start dir. |
| Default shell | `/bin/zsh`. |
| Terminal | `screen-256color`; `aggressive-resize` on. |
| Copy mode | vi keybindings. |
| Status bar | At the bottom; the right side shows the current directory, the session name, and the date/time with timezone. |

### Plugins (managed by TPM)

| Plugin | Purpose |
| ------ | ------- |
| [tpm](https://github.com/tmux-plugins/tpm) | Plugin manager. |
| [extrakto](https://github.com/laktak/extrakto) | Fuzzy-extract text, paths, URLs, and git hashes from pane output. |
| [tmux-fzf](https://github.com/sainnhe/tmux-fzf) | fzf-based fuzzy search over sessions, windows, panes, and commands. |
| [catppuccin/tmux](https://github.com/catppuccin/tmux) | Catppuccin theme (v2.x): slanted window tabs labelled by window name, plus the custom status line described above. |

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


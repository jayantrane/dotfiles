# https://zsh.sourceforge.io/Doc/Release/Options.html
# https://github.com/rothgar/mastering-zsh/blob/master/docs/config/history.md

setopt AUTO_CD                   # If command is the name of a directory, perform the cd command.

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt APPEND_HISTORY            # append to history file
setopt HIST_NO_STORE             # Don't store history commands
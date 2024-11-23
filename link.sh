#!/bin/bash

# DOFILES_DIR should be set in environment before is this to be run.
find_file() {
    local search_path=$1
    local file_name=$2
    
    # Check if search_path is a directory
    if [ ! -d "$search_path" ]; then
        echo "Find_file::Error: $search_path is not a directory."
        return 1
    fi
    
    # Use find command to search for the file recursively
    local result="$(find "$search_path" -type f -name "$file_name" -print -quit)"
    
    # Check if file was found
    if [ -n "$result" ]; then
        echo "File found at: $result"
    else
        echo "File not found."
    fi

    eval "$3='$result'"
}


link_files () {

    file_name=$1
    absolute_file_name="$HOME/$file_name"
    absolute_backup_file_name="$absolute_file_name.local"

    if [ -L $absolute_file_name ]; then
        echo "File $absolute_file_name is present and is linked."
        return 0
    fi

    if [ -f $absolute_backup_file_name ]; then
        echo "Backup file $absolute_backup_file_name is present."

        diff -q $absolute_file_name $absolute_backup_file_name 
        if [ $? -eq 0 ]; then
            echo "Original and backup file $absolute_file_name matches, can safely backup this file."

        else 
            echo "Original and backup file $absolute_file_name don't match, exiting."
            exit 1
        fi
    fi

    # Only backup the original file if it exists.
    if [ -f $absolute_file_name ]; then
        echo "Copying current file to backup."
        mv $absolute_file_name $absolute_backup_file_name

        echo "Removed file $absolute_file_name."
    fi

    # Find the to be linked file.
    link_file=''
    find_file $DOTFILES_DIR $file_name link_file
    echo "File to be linked is $link_file."

    # In all cases, make the link.
    ln -s $link_file $absolute_file_name
    echo "File $absolute_file_name linked successfully."
}

link_files ".bashrc"
link_files ".zshrc"
link_files ".tmux.conf"
link_files ".vimrc"

# VS Code paths
# Windows %APPDATA%\Code\User\settings.json
# macOS $HOME/Library/Application\ Support/Code/User/settings.json
# Linux $HOME/.config/Code/User/settings.json

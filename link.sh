#!/bin/bash

dotfiles_dir="/home/jayant/dotfiles"

find_file() {
    local search_path="$1"
    local file_name="$2"
    
    # Check if search_path is a directory
    if [ ! -d "$search_path" ]; then
        echo "Error: $search_path is not a directory."
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

    file1=$1
    file2="$file1.local"

    if [ -L $file1 ]; then
        echo "File $file1 is present and is linked."
        return 0
    fi

    if [ -f $file2 ]; then
        echo "Backup file $file2 is present."

        diff -q $file1 $file2 
        if [ $? -eq 0 ]; then
            echo "Original and backup file $file1 matches, can safely backup this file."

        else 
            echo "Original and backup file $file1 don't match, exiting."
            exit 1
        fi
    fi

    echo "Copying current file to backup."
    cp $file1 $file2

    link_file=''
    find_file $dotfiles_dir $file1 link_file

    cp $file1 "$file1.bk"
    rm $file1
    echo "Removed file $file."

    ln -s $link_file $file1
    echo "File $file1 linked successfully."
}

link_files ".bashrc"
link_files ".zshrc"
link_files ".tmux.conf"

# VS Code paths
# Windows %APPDATA%\Code\User\settings.json
# macOS $HOME/Library/Application\ Support/Code/User/settings.json
# Linux $HOME/.config/Code/User/settings.json

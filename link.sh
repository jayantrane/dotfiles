#!/bin/bash

# Determine the script's directory to make it portable
# This removes the dependency on the $DOTFILES_DIR environment variable.
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

echo "Dotfiles directory detected at: $SCRIPT_DIR"
echo "HOME is set to $HOME"
printf "%s " "Press enter to continue"
read -r ans

# Finds a file and prints its path. Uses command substitution for return.
find_file() {
    local search_path=$1
    local file_name=$2
    
    if [[ ! -d "$search_path" ]]; then
        echo "Find_file::Error: $search_path is not a directory." >&2
        return 1
    fi
    
    local result
    result=$(find "$search_path" -type f -name "$file_name" -print -quit)
    
    if [[ -n "$result" ]]; then
        echo "$result"
    else
        echo "File '$file_name' not found in '$search_path'." >&2
        return 1
    fi
}

# Finds a folder and prints its path. Uses command substitution for return.
find_folder() {
    local search_path=$1
    local folder_name=$2

    if [[ ! -d "$search_path" ]]; then
        echo "find_folder::Error: $search_path is not a directory." >&2
        return 1
    fi
    
    local result
    result=$(find "$search_path" -type d -name "$folder_name" -print -quit)
    
    if [[ -d "$result" ]]; then
        echo "$result"
    else
        echo "Folder '$folder_name' not found in '$search_path'." >&2
        return 1
    fi
}

# Links a file from the dotfiles repo to the HOME directory.
link_file () {
    local relative_path=$1
    local source_filename
    source_filename=$(basename "$relative_path")
    local absolute_dest_path="$HOME/$relative_path"
    local absolute_backup_path="$absolute_dest_path.local"

    # Ensure parent directory exists
    mkdir -p "$(dirname "$absolute_dest_path")"

    if [[ -L "$absolute_dest_path" ]]; then
        echo "Already linked: $absolute_dest_path"
        return 0
    fi

    if [[ -f "$absolute_dest_path" ]]; then
        echo "Backing up existing file: $absolute_dest_path -> $absolute_backup_path"
        if ! mv "$absolute_dest_path" "$absolute_backup_path"; then
            echo "Error: Failed to back up $absolute_dest_path. Aborting." >&2
            exit 1
        fi
    fi

    local source_file_path
    source_file_path=$(find_file "$SCRIPT_DIR" "$source_filename")
    if [[ -z "$source_file_path" ]]; then
        echo "Error: Source file '$source_filename' not found. Skipping." >&2
        return
    fi

    echo "Linking: $source_file_path -> $absolute_dest_path"
    ln -s "$source_file_path" "$absolute_dest_path"
}

# Links a folder from the dotfiles repo to the HOME directory.
link_folder() {
    local dest_path=$1
    local source_folder_name=$2
    local absolute_dest_path="$HOME/$dest_path"

    # Ensure parent directory exists
    mkdir -p "$(dirname "$absolute_dest_path")"

    if [[ -L "$absolute_dest_path" ]]; then
        echo "Already linked: $absolute_dest_path"
        return 0
    fi

    if [[ -d "$absolute_dest_path" ]]; then
        echo "Warning: Destination '$absolute_dest_path' exists and is not a symlink. Skipping." >&2
        return
    fi

    local source_folder_path
    source_folder_path=$(find_folder "$SCRIPT_DIR" "$source_folder_name")
    if [[ -z "$source_folder_path" ]]; then
        echo "Error: Source folder '$source_folder_name' not found. Skipping." >&2
        return
    fi

    echo "Linking folder: $source_folder_path -> $absolute_dest_path"
    ln -s "$source_folder_path" "$absolute_dest_path"
}

# --- Declarative linking ---
# Add files and folders to be linked to these arrays.

# Files to link directly into $HOME or specified path
# Format: "path/in/home/.filename"
files_to_link=(
    ".bashrc"
    ".zshrc"
    ".tmux.conf"
    ".vimrc"
    ".config/Code/User/settings.json"
    ".config/Code/User/keybindings.json"
)

# Folders to link
# Format: "path/in/home/.config/folder_name" "source_folder_name_in_repo"
declare -A folders_to_link=(
    [".config/nvim"]="nvim"
    [".config/kitty"]="kitty"
)

echo "--- Starting file linking process ---"
for file in "${files_to_link[@]}"; do
    link_file "$file"
done

echo "--- Starting folder linking process ---"
for dest in "${!folders_to_link[@]}"; do
    link_folder "$dest" "${folders_to_link[$dest]}"
done

echo "--- Linking complete ---"
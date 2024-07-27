# Remove "._*" files; These comes from Mac, contains file attributes and stuff
find . -type f -name '._*' -delete

# Remove '.DS_Store' files; These contains metadate about the folders, their properties about view and stuff
find . -type f -name '.DS_Store' -delete
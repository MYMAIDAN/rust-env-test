#!/bin/bash

# Paths to the base, local, and remote versions of the file
BASE=$1
LOCAL=$2
REMOTE=$3

# Temporary file to store merge result
MERGED=$(mktemp)

echo "Script has been executed"

# Merge with default tool first
git merge-file $LOCAL $BASE $REMOTE -L local -L base -L remote > $MERGED

# Check if the 'test' branch has the specific line
#if grep -q 'branch = "apply-fmt"' $REMOTE; then
  # Replace the line for base64 dependency in the merged file
  #sed -i '/base64 = {git="https:\/\/github.com\/marshallpierce\/rust-base64.git", branch = "master"}/c\base64 = {git="https://github.com/marshallpierce/rust-base64.git", branch = "apply-fmt"}' $MERGED
#fi
cat $MERGED
# Move the merged content to the original file
cat $REMOTE > $LOCAL

# Clean up
rm $MERGED

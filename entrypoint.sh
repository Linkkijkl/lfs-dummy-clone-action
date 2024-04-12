#!/bin/bash

cd /github/workspace
ls -als

DUMMY_DIR=/dummies

git config --global --add safe.directory "$GITHUB_WORKSPACE"

git lfs ls-files

LFS_FILES=`git lfs ls-files | awk '{split($0,a," "); print a[3]}'`

echo "LFS file list:"
echo $LFS_FILES

for f in $LFS_FILES
do
    EXTENSION="${f##*.}"
    DUMMY_FILE_PATH="$DUMMY_DIR/dummy.$EXTENSION"
    if [ -f $DUMMY_FILE_PATH ]; then
        # Copy dummy in place of real file
        cp $DUMMY_FILE_PATH $f
    else
        echo "Dummy file for extension $EXTENSION does not exist" >&2
    fi
done

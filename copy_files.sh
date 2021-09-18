#!/bin/sh
set -e

if [ -z "$1" ] || [ ! -d "$1" ]
then
    echo "first argument must be a directory"
    exit 1
fi

if [ -z "$2" ] || [ ! -d "$2" ]
then
    echo "second argument must be a directory"
    exit 1
fi

echo "Copy git tracked files from $1 into $2"
echo cp $(git ls-tree -r master --name-only | grep -v -x -F .gitignore | grep -v -x -F copy_files.sh | sed s-^-"$1"/-) "$2"

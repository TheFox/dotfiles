#!/usr/bin/env bash

# Remove a file from Git History.

# http://dound.com/2009/04/git-forever-remove-files-or-folders-from-history/
# http://stackoverflow.com/a/14728706
# https://gist.github.com/TheFox/62f73dcfbb0ba6593544

files="$*"

git remote -v
git remote rm origin

git filter-branch --index-filter "git rm -rf --cached --ignore-unmatch $files" HEAD

rm -vrf .git/refs/original/ && git reflog expire --all && git gc --aggressive --prune

#git remote add origin <URL>
#git push -f origin master

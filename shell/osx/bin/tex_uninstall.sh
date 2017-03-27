#!/usr/bin/env bash

# Uninstall MacTex
# https://www.tug.org/mactex/uninstalling.html


DIRS="/Applications/TeX.app /Library/TeX /Library/PreferencePanes/TeXDistPrefPane.prefPane /usr/local/texlive /usr/texbin"
FILES="/etc/paths.d/TeX"
MAN_FILES_DE=""
MAN_FILES_C=""

# Ask for the administrator password upfront.
echo 'ask for sudo'
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

for dir in $DIRS; do
	( ls -lad "$dir" 2> /dev/null; [ -d "$dir" ] && echo sudo rm -vrfd "$dir" && sudo rm -vrfd "$dir" )
done

for file in $FILES $MAN_FILES_DE $MAN_FILES_C; do
	( ls -lad "$file" 2> /dev/null; [ -f "$file" ] && echo sudo rm -vrfd "$file" && sudo rm -vrfd "$file" )
done

echo 'done'

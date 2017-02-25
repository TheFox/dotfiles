#!/usr/bin/env bash

# Uninstall the Fish Shell.
# http://fishshell.com/


RM="rm -vrfd"
LS="ls -lad"
DIRS="/usr/local/etc/fish /usr/local/share/fish"
FILES="/usr/local/bin/fish /usr/local/bin/fish_indent"
MAN_FILES_DE=""
MAN_FILES_C="/usr/local/share/man/man1/fish.1 /usr/local/share/man/man1/fish_indent.1 /usr/local/share/man/man1/fish_pager.1 /usr/local/share/man/man1/fishd.1 /usr/local/share/man/man1/set_color.1"

# Ask for the administrator password upfront.
echo 'ask for sudo'
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

for dir in $DIRS; do
	( $LS $dir 2> /dev/null; [ -d $dir ] && sudo $RM $dir )
done

for file in $FILES $MAN_FILES_DE $MAN_FILES_C; do
	( $LS $file 2> /dev/null; [ -f $file ] && sudo $RM $file )
done

echo 'done'

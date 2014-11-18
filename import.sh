#!/usr/bin/env bash
# Overwrite files on the local machine.

DATE=$(date +"%Y/%m/%d %H:%M:%S")
SCRIPT_BASEDIR=$(dirname $0)
CP="cp -vp"


set -e
cd $SCRIPT_BASEDIR
echo "WD:   $PWD"
echo "HOME: $HOME"


echo 'import default files'
for file in $(cat .files); do
	#echo $file
	
	$CP $file $HOME || echo failed
done

SUBLIME_USER_DIR="$HOME/Library/Application Support/Sublime Text 2/Packages/User"
if [[ -d $SUBLIME_USER_DIR ]]; then
	echo 'import sublimetext user files'
	echo $SUBLIME_USER_DIR
	
	$CP sublimetext/keymaps/*.sublime-keymap "$SUBLIME_USER_DIR" || echo failed
	$CP sublimetext/settings/*.sublime-settings "$SUBLIME_USER_DIR" || echo failed
fi

SUBLIME_SNIPPET_PHP_DIR="$HOME/Library/Application Support/Sublime Text 2/Packages/PHP"
if [[ -d $SUBLIME_SNIPPET_PHP_DIR ]]; then
	echo 'import sublimetext PHP snippet files'
	echo $SUBLIME_SNIPPET_PHP_DIR
	
	$CP sublimetext/snippets/PHP/*.sublime-snippet "$SUBLIME_SNIPPET_PHP_DIR" || echo failed
fi

SUBLIME_SNIPPET_CPP_DIR="$HOME/Library/Application Support/Sublime Text 2/Packages/C++"
if [[ -d $SUBLIME_SNIPPET_CPP_DIR ]]; then
	echo 'import sublimetext C++ snippet files'
	echo $SUBLIME_SNIPPET_CPP_DIR
	
	$CP sublimetext/snippets/C++/*.sublime-snippet "$SUBLIME_SNIPPET_CPP_DIR" || echo failed
fi

echo done

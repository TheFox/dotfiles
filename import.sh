#!/usr/bin/env bash
# Overwrite files on the local machine.

DATE=$(date +"%Y/%m/%d %H:%M:%S")
SCRIPT_BASEDIR=$(dirname $0)
CP="cp -vp"
MV="mv -v"
MKDIR="mkdir -p"
SUBLIME_SUBL="/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl"


set -e
cd $SCRIPT_BASEDIR
source functions.sh

echo "WD:   $PWD"
echo "HOME: $HOME"


echo 'import default files'
for file in $(cat .files); do
	#echo $file
	
	$CP $file $HOME || echo failed
	true
done

SUBLIME_USER_DIR="$HOME/Library/Application Support/Sublime Text 2/Packages/User"
if [[ -d $SUBLIME_USER_DIR ]]; then
	echo 'import sublimetext user files'
	#echo $SUBLIME_USER_DIR
	
	copytmp 'sublimetext/keymaps/*.sublime-keymap' "$SUBLIME_USER_DIR"
	copytmp 'sublimetext/settings/*.sublime-settings' "$SUBLIME_USER_DIR"
fi

SUBLIME_SNIPPET_PHP_DIR="$HOME/Library/Application Support/Sublime Text 2/Packages/PHP"
if [[ -d $SUBLIME_SNIPPET_PHP_DIR ]]; then
	echo 'import sublimetext PHP snippet files'
	#echo $SUBLIME_SNIPPET_PHP_DIR
	
	copytmp 'sublimetext/snippets/PHP/*.sublime-snippet' "$SUBLIME_SNIPPET_PHP_DIR" || echo failed
	copytmp 'sublimetext/snippets/PHP/*.sublime-completions' "$SUBLIME_SNIPPET_PHP_DIR" || echo failed
fi

SUBLIME_SNIPPET_PERL_DIR="$HOME/Library/Application Support/Sublime Text 2/Packages/Perl"
if [[ -d $SUBLIME_SNIPPET_PERL_DIR ]]; then
	echo 'import sublimetext Perl snippet files'
	#echo $SUBLIME_SNIPPET_PERL_DIR
	
	copytmp 'sublimetext/snippets/Perl/*.sublime-snippet' "$SUBLIME_SNIPPET_PERL_DIR" || echo failed
	#copytmp 'sublimetext/snippets/Perl/*.sublime-completions' "$SUBLIME_SNIPPET_PERL_DIR" || echo failed
fi

SUBLIME_SNIPPET_CPP_DIR="$HOME/Library/Application Support/Sublime Text 2/Packages/C++"
if [[ -d $SUBLIME_SNIPPET_CPP_DIR ]]; then
	echo 'import sublimetext C++ snippet files'
	#echo $SUBLIME_SNIPPET_CPP_DIR
	
	copytmp 'sublimetext/snippets/C++/*.sublime-snippet' "$SUBLIME_SNIPPET_CPP_DIR" || echo failed
fi

if [[ ! -d $HOME/bin ]]; then
	$MKDIR $HOME/bin
fi
$CP shell/bin/* $HOME/bin

if [[ -f "$SUBLIME_SUBL" ]] && [[ ! -f $HOME/bin/subl ]]; then
	echo 'install subl'
	ln -s "$SUBLIME_SUBL" $HOME/bin/subl
fi

date
echo 'done'

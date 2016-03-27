#!/usr/bin/env bash
# Overwrite files on the local machine.

DATE=$(date +"%Y-%m-%d %H:%M:%S")
SCRIPT_BASEDIR=$(dirname $0)
CP="cp"
MV="mv"
RSYNC="rsync -rupt"
MKDIR="mkdir -p"
SUBLIME_SUBL="/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl"


set -e
cd $SCRIPT_BASEDIR
source ./functions.sh

echo "WD:   $PWD"
echo "HOME: $HOME"


echo 'import default files'
for file in $(cat .files); do
	$RSYNC $file $HOME/ || echo failed
	true
done

if [[ ! -d $HOME/bin ]]; then
	$MKDIR $HOME/bin
fi
$RSYNC shell/common/bin/* $HOME/bin/
$RSYNC shell/osx/bin/* $HOME/bin/

if [[ -f "$SUBLIME_SUBL" ]] && [[ ! -f $HOME/bin/subl ]]; then
	echo 'install subl'
	ln -s "$SUBLIME_SUBL" $HOME/bin/subl
fi

SUBLIME_USER_DIR="$HOME/Library/Application Support/Sublime Text 2/Packages/User"
if [[ -d $SUBLIME_USER_DIR ]]; then
	echo 'import sublimetext user files'
	
	copytmp 'sublimetext/keymaps/*.sublime-keymap' "$SUBLIME_USER_DIR"
	copytmp 'sublimetext/settings/*.sublime-settings' "$SUBLIME_USER_DIR"
fi

SUBLIME_SNIPPET_PHP_DIR="$HOME/Library/Application Support/Sublime Text 2/Packages/PHP"
if [[ -d $SUBLIME_SNIPPET_PHP_DIR ]]; then
	echo 'import sublimetext PHP snippet files'
	
	copytmp 'sublimetext/snippets/PHP/*.sublime-snippet' "$SUBLIME_SNIPPET_PHP_DIR" || echo failed
	copytmp 'sublimetext/snippets/PHP/*.sublime-completions' "$SUBLIME_SNIPPET_PHP_DIR" || echo failed
fi

SUBLIME_SNIPPET_PERL_DIR="$HOME/Library/Application Support/Sublime Text 2/Packages/Perl"
if [[ -d $SUBLIME_SNIPPET_PERL_DIR ]]; then
	echo 'import sublimetext Perl snippet files'
	
	copytmp 'sublimetext/snippets/Perl/*.sublime-snippet' "$SUBLIME_SNIPPET_PERL_DIR" || echo failed
fi

SUBLIME_SNIPPET_RUBY_DIR="$HOME/Library/Application Support/Sublime Text 2/Packages/Ruby"
if [[ -d $SUBLIME_SNIPPET_RUBY_DIR ]]; then
	echo 'import sublimetext Ruby snippet files'
	
	copytmp 'sublimetext/snippets/Ruby/*.sublime-snippet' "$SUBLIME_SNIPPET_RUBY_DIR" || echo failed
fi

SUBLIME_SNIPPET_CPP_DIR="$HOME/Library/Application Support/Sublime Text 2/Packages/C++"
if [[ -d $SUBLIME_SNIPPET_CPP_DIR ]]; then
	echo 'import sublimetext C++ snippet files'
	
	copytmp 'sublimetext/snippets/C++/*.sublime-snippet' "$SUBLIME_SNIPPET_CPP_DIR" || echo failed
fi

SUBLIME_SNIPPET_OBJC_DIR="$HOME/Library/Application Support/Sublime Text 2/Packages/Objective-C"
if [[ -d $SUBLIME_SNIPPET_OBJC_DIR ]]; then
	echo 'import sublimetext Objective-C snippet files'
	
	copytmp 'sublimetext/snippets/Objective-C/*.sublime-snippet' "$SUBLIME_SNIPPET_OBJC_DIR" || echo failed
fi

SUBLIME_SNIPPET_MARKDOWN_DIR="$HOME/Library/Application Support/Sublime Text 2/Packages/Markdown"
if [[ -d $SUBLIME_SNIPPET_MARKDOWN_DIR ]]; then
	echo 'import sublimetext Markdown snippet files'
	
	copytmp 'sublimetext/snippets/Markdown/*.sublime-snippet' "$SUBLIME_SNIPPET_MARKDOWN_DIR" || echo failed
fi

SUBLIME_SNIPPET_HTML_DIR="$HOME/Library/Application Support/Sublime Text 2/Packages/HTML"
if [[ -d $SUBLIME_SNIPPET_HTML_DIR ]]; then
	echo 'import sublimetext HTML snippet files'
	
	copytmp 'sublimetext/snippets/HTML/*.sublime-snippet' "$SUBLIME_SNIPPET_HTML_DIR" || echo failed
fi

SUBLIME_SNIPPET_TWIG_DIR="$HOME/Library/Application Support/Sublime Text 2/Packages/Twig/Snippets"
if [[ -d $SUBLIME_SNIPPET_TWIG_DIR ]]; then
	echo 'import sublimetext Twig snippet files'
	
	copytmp 'sublimetext/snippets/Twig/*.sublime-snippet' "$SUBLIME_SNIPPET_TWIG_DIR" || echo failed
fi

SUBLIME_SNIPPET_JAVASCRIPT_DIR="$HOME/Library/Application Support/Sublime Text 2/Packages/JavaScript"
if [[ -d $SUBLIME_SNIPPET_JAVASCRIPT_DIR ]]; then
	echo 'import sublimetext JavaScript snippet files'
	
	copytmp 'sublimetext/snippets/JavaScript/*.sublime-snippet' "$SUBLIME_SNIPPET_JAVASCRIPT_DIR" || echo failed
fi

date
echo 'done'

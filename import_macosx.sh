#!/usr/bin/env bash
# Overwrite files on the local machine.

#DATE=$(date +"%Y-%m-%d %H:%M:%S %z")
SCRIPT_BASEDIR=$(dirname $0)
CP="cp"
MV="mv"
RSYNC="rsync -rupt"
MKDIR="mkdir -p"
SUBLIME_SUBL="${HOME}/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl"


set -e
cd $SCRIPT_BASEDIR
source ./functions.sh

echo "WORKING DIR: ${PWD}"
echo "HOME: ${HOME}"


$RSYNC shell/osx/bin/* "${HOME}/bin/"

if [[ -f "${SUBLIME_SUBL}" ]] && [[ ! -f "${HOME}/bin/subl" ]]; then
	echo 'install subl'
	ln -sf "${SUBLIME_SUBL}" "${HOME}/bin/subl"
fi

SUBLIME_USER_DIR="$HOME/Library/Application Support/Sublime Text 2/Packages/User"
if [[ -d "${SUBLIME_USER_DIR}" ]]; then
	echo 'import Sublime Text 2 user files'
	
	copytmp 'sublimetext2/keymaps/*.sublime-keymap' "${SUBLIME_USER_DIR}"
	copytmp 'sublimetext2/settings/*.sublime-settings' "${SUBLIME_USER_DIR}"
fi

SUBLIME_SNIPPET_PHP_DIR="$HOME/Library/Application Support/Sublime Text 2/Packages/PHP"
if [[ -d "${SUBLIME_SNIPPET_PHP_DIR}" ]]; then
	echo 'import Sublime Text 2 PHP snippet files'
	
	copytmp 'sublimetext2/snippets/PHP/*.sublime-snippet' "${SUBLIME_SNIPPET_PHP_DIR}" || echo failed
	copytmp 'sublimetext2/snippets/PHP/*.sublime-completions' "${SUBLIME_SNIPPET_PHP_DIR}" || echo failed
fi

SUBLIME_SNIPPET_PERL_DIR="$HOME/Library/Application Support/Sublime Text 2/Packages/Perl"
if [[ -d "${SUBLIME_SNIPPET_PERL_DIR}" ]]; then
	echo 'import Sublime Text 2 Perl snippet files'
	
	copytmp 'sublimetext2/snippets/Perl/*.sublime-snippet' "${SUBLIME_SNIPPET_PERL_DIR}" || echo failed
fi

SUBLIME_SNIPPET_RUBY_DIR="$HOME/Library/Application Support/Sublime Text 2/Packages/Ruby"
if [[ -d "${SUBLIME_SNIPPET_RUBY_DIR}" ]]; then
	echo 'import Sublime Text 2 Ruby snippet files'
	
	copytmp 'sublimetext2/snippets/Ruby/*.sublime-snippet' "${SUBLIME_SNIPPET_RUBY_DIR}" || echo failed
fi

SUBLIME_SNIPPET_CPP_DIR="$HOME/Library/Application Support/Sublime Text 2/Packages/C++"
if [[ -d "${SUBLIME_SNIPPET_CPP_DIR}" ]]; then
	echo 'import Sublime Text 2 C++ snippet files'
	
	copytmp 'sublimetext2/snippets/C++/*.sublime-snippet' "${SUBLIME_SNIPPET_CPP_DIR}" || echo failed
fi

SUBLIME_SNIPPET_OBJC_DIR="$HOME/Library/Application Support/Sublime Text 2/Packages/Objective-C"
if [[ -d "${SUBLIME_SNIPPET_OBJC_DIR}" ]]; then
	echo 'import Sublime Text 2 Objective-C snippet files'
	
	copytmp 'sublimetext2/snippets/Objective-C/*.sublime-snippet' "${SUBLIME_SNIPPET_OBJC_DIR}" || echo failed
fi

SUBLIME_SNIPPET_MARKDOWN_DIR="$HOME/Library/Application Support/Sublime Text 2/Packages/Markdown"
if [[ -d "${SUBLIME_SNIPPET_MARKDOWN_DIR}" ]]; then
	echo 'import Sublime Text 2 Markdown snippet files'
	
	copytmp 'sublimetext2/snippets/Markdown/*.sublime-snippet' "${SUBLIME_SNIPPET_MARKDOWN_DIR}" || echo failed
fi

SUBLIME_SNIPPET_HTML_DIR="$HOME/Library/Application Support/Sublime Text 2/Packages/HTML"
if [[ -d "${SUBLIME_SNIPPET_HTML_DIR}" ]]; then
	echo 'import Sublime Text 2 HTML snippet files'
	
	copytmp 'sublimetext2/snippets/HTML/*.sublime-snippet' "${SUBLIME_SNIPPET_HTML_DIR}" || echo failed
fi

SUBLIME_SNIPPET_TWIG_DIR="$HOME/Library/Application Support/Sublime Text 2/Packages/Twig/Snippets"
if [[ -d "${SUBLIME_SNIPPET_TWIG_DIR}" ]]; then
	echo 'import Sublime Text 2 Twig snippet files'
	
	copytmp 'sublimetext2/snippets/Twig/*.sublime-snippet' "${SUBLIME_SNIPPET_TWIG_DIR}" || echo failed
fi

SUBLIME_SNIPPET_JAVASCRIPT_DIR="$HOME/Library/Application Support/Sublime Text 2/Packages/JavaScript"
if [[ -d "${SUBLIME_SNIPPET_JAVASCRIPT_DIR}" ]]; then
	echo 'import Sublime Text 2 JavaScript snippet files'
	
	copytmp 'sublimetext2/snippets/JavaScript/*.sublime-snippet' "${SUBLIME_SNIPPET_JAVASCRIPT_DIR}" || echo failed
fi

SUBLIME_SNIPPET_SHELLSCRIPT_DIR="$HOME/Library/Application Support/Sublime Text 2/Packages/ShellScript"
if [[ -d "${SUBLIME_SNIPPET_SHELLSCRIPT_DIR}" ]]; then
	echo 'import Sublime Text 2 ShellScript snippet files'
	
	copytmp 'sublimetext2/snippets/ShellScript/*.sublime-snippet' "${SUBLIME_SNIPPET_SHELLSCRIPT_DIR}" || echo failed
fi

date
echo 'done'

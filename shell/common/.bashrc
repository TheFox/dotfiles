
brew_path=$(brew --prefix 2> /dev/null || true)

if [ -f $brew_path/etc/bash_completion ]; then
	. $brew_path/etc/bash_completion
fi

if [ -f $brew_path/etc/bash_completion.d/git ]; then
	. $brew_path/etc/bash_completion.d/git
fi

if [ -f $brew_path/etc/bash_completion.d/git-completion.bash ]; then
	. $brew_path/etc/bash_completion.d/git-completion.bash
fi

if [ -f $brew_path/etc/bash_completion.d/youtube-dl.bash-completion ]; then
	. $brew_path/etc/bash_completion.d/youtube-dl.bash-completion
fi

PATH="${PATH}:$HOME/bin:$HOME/Dropbox/bin"
PS1='\[\033[0;31m\]\W\[\033[0m\]\$ '
EDITOR="/usr/bin/vi"
HISTSIZE=5000
HISTFILESIZE=10000

export PS1 PATH EDITOR


if [ "$(uname -s)" = "Darwin" ]; then
	alias l="ls -lG"
	alias ll="ls -laG"
else
	alias l="ls -l --color=auto"
	alias ll="ls -la --color=auto"
fi

alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias d="date"
alias tarc="tar -vpc --exclude .DS_Store -f"

case "$TERM" in
	xterm*|rxvt*)
		# Use ${PWD} in PROMPT_COMMAND to open a new tab in Mac OS X
		# Terminal in the same working directory.
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}#$$\007"'
		;;
	*)
		;;
esac

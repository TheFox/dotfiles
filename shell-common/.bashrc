
PS1='[\[\033[0;31m\]\w\[\033[m\]\[\033[32m\]$(__git_ps1 "(%s)")\[\033[m\]]\$ '

PATH="${PATH}:$HOME/bin:$HOME/Dropbox/bin"
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

case "$TERM" in
	xterm*|rxvt*)
		# Use ${PWD} in PROMPT_COMMAND to open a new tab in Mac OS X
		# Terminal in the same working directory.
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}#$$\007"'
		;;
	*)
		;;
esac


PS1="\n\[\033[0;34m\]\d \t \#:\! \[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h\[\033[m\]:\[\033[0;31m\]\w\[\033[m\] \$?\n:> "
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

case "$TERM" in
	xterm*|rxvt*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}:${PWD} ($$)\007"; export DATE="`date +"%Y%m%d"`"'
		;;
	*)
		;;
esac


PS1=':> '
PATH="${PATH}:$HOME/Dropbox/bin"
export EDITOR="/usr/bin/vi"

alias l="ls -lG"
alias ll="ls -laG"
alias grep="grep --colour=auto"
alias egrep="egrep --color=auto"

case "$TERM" in
	xterm*|rxvt*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}:${PWD} ($$)\007"; export DATE="`date +"%Y%m%d"`"'
		;;
	*)
		;;
esac

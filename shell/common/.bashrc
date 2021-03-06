
brew_path=$(brew --prefix 2> /dev/null || true)

if [ -f "${brew_path}/etc/bash_completion" ]; then
	source "${brew_path}/etc/bash_completion"
fi

if [ -f "${brew_path}/etc/bash_completion.d/git" ]; then
	source "${brew_path}/etc/bash_completion.d/git"
fi

if [ -f "${brew_path}/etc/bash_completion.d/git-completion.bash" ]; then
	source "${brew_path}/etc/bash_completion.d/git-completion.bash"
fi

if [ -f "${brew_path}/etc/bash_completion.d/youtube-dl.bash-completion" ]; then
	source "${brew_path}/etc/bash_completion.d/youtube-dl.bash-completion"
fi

PATH="$HOME/bin:$HOME/.composer/vendor/bin:$HOME/Dropbox/bin:${PATH}"
PS1='\[\033[0;31m\]\W\[\033[0m\]\$ '
EDITOR="/usr/bin/vi"
HISTSIZE=5000
HISTFILESIZE=10000

export PATH PS1 EDITOR

shopt -s histappend
set -o vi

if [ "$(uname -s)" = "Darwin" ]; then
	alias l='ls -lG'
	alias ll='ls -laG'
else
	alias l='ls -l --color=auto'
	alias ll='ls -la --color=auto'
fi

alias c='ncal -w'
alias d='date +"%Y-%m-%d %H:%M:%S %z"'
alias t='date +"%H:%M:%S %z"'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias tarc='tar -vpc --exclude .DS_Store -f'
alias gzipc='gzip --best --force --keep'
alias gpgf='gpg --sign --encrypt'
alias oo='open .'

# Git Aliases
alias ga='git add'
alias gap='git add -p'
alias gau='git add -u'
alias gb='git branch'
alias gco='git checkout'
alias gc='git commit'
alias gca='git commit --amend'
alias gd='git diff'
alias gl="git log -n 15 --pretty=format:'%h %ae %ad %s' --date=iso"
alias gm='git merge'
alias gv='git pull'
alias gp='git push'
alias gs='git status'
alias gr='git remote -v'

case "${TERM}" in
	xterm*|rxvt*)
		# Use ${PWD} in PROMPT_COMMAND to open a new tab in Mac OS X
		# Terminal in the same working directory.
		hostn=${HOSTNAME/.local/}
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${hostn}#$$\007"'
		;;
	*)
		;;
esac

GPG_TTY=$(tty)
export GPG_TTY

if [ -f "${HOME}/.gpg-agent-info" ]; then
	
	source "${HOME}/.gpg-agent-info"
	export GPG_AGENT_INFO
	export SSH_AUTH_SOCK
fi

which rbenv &> /dev/null && eval "$(rbenv init -)"

PHP5=/usr/local/Cellar/php56/5.6.25_1/bin/php
PHP7=/usr/local/Cellar/php70/7.0.11_2/bin/php
PHP70=/usr/local/Cellar/php70/7.0.11_2/bin/php
PHP71=/usr/local/Cellar/php71/7.1.0-rc.5_9/bin/php
export PHP5 PHP7 PHP70 PHP71

HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ANALYTICS

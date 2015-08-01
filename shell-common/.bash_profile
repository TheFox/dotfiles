
brew_path=$(brew --prefix 2> /dev/null || true)

scripts="$brew_path/etc/bash_completion"

if [ -f $brew_path/etc/bash_completion ]; then
	. $brew_path/etc/bash_completion
fi

if [ -f $brew_path/etc/bash_completion.d/git-completion.bash ]; then
	. $brew_path/etc/bash_completion.d/git-completion.bash
fi

if [ -f $brew_path/etc/bash_completion.d/git-prompt.sh ]; then
	. $brew_path/etc/bash_completion.d/git-prompt.sh
fi

if [ -f $brew_path/etc/bash_completion.d/youtube-dl.bash-completion ]; then
	. $brew_path/etc/bash_completion.d/youtube-dl.bash-completion
fi

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

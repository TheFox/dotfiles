
brew_path=$(brew --prefix 2> /dev/null || true)

scripts="$brew_path/etc/bash_completion"

if [ -f $brew_path/etc/bash_completion ]; then
	echo "source $brew_path/etc/bash_completion"
	. $brew_path/etc/bash_completion
fi

if [ -f $brew_path/etc/bash_completion.d/git-completion.bash ]; then
	echo "source $brew_path/etc/bash_completion.d/git-completion.bash"
	. $brew_path/etc/bash_completion.d/git-completion.bash
fi

if [ -f $brew_path/etc/bash_completion.d/git-prompt.sh ]; then
	echo "source $brew_path/etc/bash_completion.d/git-prompt.sh"
	. $brew_path/etc/bash_completion.d/git-prompt.sh
fi

if [ -f $brew_path/etc/bash_completion.d/youtube-dl.bash-completion ]; then
	. $brew_path/etc/bash_completion.d/youtube-dl.bash-completion
fi

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

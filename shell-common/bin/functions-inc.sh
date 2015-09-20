
slack_notification(){
	text=$1
	bin=~/work/dev/slack/bin/msg
	if [ -f $bin ]; then
		$bin "$text"
	fi
}

notification(){
	text=$1
	
	slack_notification "$text"
}

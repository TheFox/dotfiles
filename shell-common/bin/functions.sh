
slack_notification(){
	msg=$1
	bin=~/work/dev/slack/bin/msg
	if [ -f $bin ]; then
		$bin "$msg"
	fi
}

notification(){
	msg=$1
	
	slack_notification "$msg"
}

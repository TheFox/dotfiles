#!/usr/bin/env bash

setLowPrio(){
	name=$1
	#ps aux | grep -v grep | grep $name
	pid=$(ps aux | grep -v grep | grep $name | awk '{ print $2 }')
	echo "pid: $pid"
	ps aux | grep $pid
	sudo renice -n 20 -p $pid
}

setLowPrio Bitcoin-Qt
setLowPrio bitmessagemain.py

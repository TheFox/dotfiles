#!/usr/bin/env bash

copytmp(){
	src="$1"
	dst="$2"
	
	for file in $src; do
		bn=$(basename "$file")
		tmp=$bn.tmp
		#echo "file: '$bn' '$dst'"
		$CP "$file" "$dst/$tmp" || return $?
		$MV "$dst/$tmp" "$dst/$bn" || return $?
	done
	
	return $?
}

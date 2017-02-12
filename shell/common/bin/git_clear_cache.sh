#!/usr/bin/env bash

# Git Clean Cache

# Original: http://stackoverflow.com/questions/3797907/howto-remove-unused-objects-from-a-git-repsitory
# 2014-06-30 https://gist.github.com/TheFox/adf1c97916ea0e2d5083

file=$1
git -c gc.reflogExpire=0 -c gc.reflogExpireUnreachable=0 \
	-c gc.rerereresolved=0 -c gc.rerereunresolved=0 \
	-c gc.pruneExpire=now gc "$file"

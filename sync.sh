#!/usr/bin/env bash

RSYNC="rsync -vurpt"

if [ "${SRC_HOST}" = "" ]; then
	echo "ERROR: you need do set 'SRC_HOST'"
	exit 1
fi

echo "src host: '${SRC_HOST}'"

# Thunderbird
${RSYNC} ${SRC_HOST}:~/Library/Preferences/org.mozilla.thunderbird.plist ~/Library/Preferences/org.mozilla.thunderbird.plist
${RSYNC} ${SRC_HOST}:'~/Library/Saved\ Application\ State/org.mozilla.thunderbird.savedState' ~/Library/Saved\ Application\ State/
${RSYNC} ${SRC_HOST}:'~/Library/Thunderbird' ~/Library/

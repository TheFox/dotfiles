#!/usr/bin/env bash

DATE=$(date +"%Y-%m-%d %H:%M:%S")
SCRIPT_BASEDIR=$(dirname $0)


set -e
cd $SCRIPT_BASEDIR

un=$(uname -s)
script_name="linux"
if [ "$un" = "Darwin" ]; then
	script_name="macosx"
fi

echo 'remove old files'
rm -f ~/bin/changelog.sh
rm -f ~/bin/functions.sh
rm -f ~/bin/functions-inc.sh
rm -f ~/bin/release

echo "script_name: '${script_name}'"
./import_${script_name}.sh

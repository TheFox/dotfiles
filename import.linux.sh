#!/usr/bin/env bash
# Overwrite files on the local machine.

DATE=$(date +"%Y-%m-%d %H:%M:%S")
SCRIPT_BASEDIR=$(dirname $0)
CP="cp"
MV="mv"
RSYNC="rsync -rupt"
MKDIR="mkdir -p"


set -e
cd $SCRIPT_BASEDIR
source ./functions.sh

echo "WD:   $PWD"
echo "HOME: $HOME"


echo 'import default files'
for file in $(cat .files); do
	$RSYNC $file $HOME/ || echo failed
	true
done

if [[ ! -d $HOME/bin ]]; then
	$MKDIR $HOME/bin
fi
$RSYNC shell-common/bin/* $HOME/bin/
#$RSYNC shell-linux/bin/* $HOME/bin/

date
echo 'done'

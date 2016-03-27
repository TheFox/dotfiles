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


#$RSYNC shell/linux/bin/* $HOME/bin/

date
echo 'done'

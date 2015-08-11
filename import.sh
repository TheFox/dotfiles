#!/usr/bin/env bash

DATE=$(date +"%Y/%m/%d %H:%M:%S")
SCRIPT_BASEDIR=$(dirname $0)


set -e
cd $SCRIPT_BASEDIR

un=$(uname -s)
script_name="linux"
if [[ "$un" -eq "Darwin" ]]; then
	script_name="macosx"
fi

echo ./import.$script_name.sh

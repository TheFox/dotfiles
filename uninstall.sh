#!/usr/bin/env bash

SCRIPT_BASEDIR=$(dirname $0)
RM="rm"


set -e
cd $SCRIPT_BASEDIR

echo 'uninstall default files'
for file in $(cat .files); do
	bn=$(basename $file)
	
	$RM $HOME/$bn
done

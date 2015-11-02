#!/usr/bin/env bash

set -e

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo

networksetup -getinfo 'Ethernet'
echo

networksetup -getinfo 'iPhone USB'
echo

networksetup -getinfo 'Wi-Fi'
echo

sudo ifconfig en0
echo

sudo ifconfig en1
echo

sudo ifconfig en5
echo


echo
echo 'press any-key do continue, ctrl-c to abort.'
read

echo 'down en0'
sudo ifconfig en0 down
echo "status: $?"
echo

echo 'down en1'
sudo ifconfig en1 down
echo "status: $?"
echo

echo 'up en5'
sudo ifconfig en5 up
echo "status: $?"
echo

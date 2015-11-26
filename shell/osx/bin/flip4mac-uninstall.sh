#!/usr/bin/env bash

# http://www.telestream.net/flip4mac/overview.htm


RM="rm -vrfd"

# Ask for the administrator password upfront.
echo 'ask for sudo'
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

sudo $RM /Library/Audio/Plug-Ins/Components/Flip4Mac\ WMA\ Import.component
sudo $RM /Library/Internet\ Plug-Ins/Flip4Mac\ WMV\ Plugin.plugin
sudo $RM /Library/PreferencePanes/Flip4Mac\ WMV.prefPane
sudo $RM /Library/QuickTime/Flip4Mac\ WMV\ Advanced.component
sudo $RM /Library/QuickTime/Flip4Mac\ WMV\ Export.component
sudo $RM /Library/QuickTime/Flip4Mac\ WMV\ Import.component

echo 'done'

#!/usr/bin/env bash

# Uninstall Microsoft Silverlight under macOS.
# https://social.msdn.microsoft.com/Forums/silverlight/en-US/2c317f5e-ded5-4ba6-b730-f11771b8cfd9/uninstall-silverlight-on-mac-os-x?forum=silverlightinstall


RM="rm -vrfd"

# Ask for the administrator password upfront.
echo 'ask for sudo'
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

sudo $RM /Applications/Microsoft\ Silverlight
sudo $RM /Library/Internet\ Plug-Ins/Silverlight.plugin
sudo $RM /Library/Application\ Support/Microsoft/Silverlight
sudo $RM ~/Library/Application\ Support/Microsoft/Silverlight
sudo $RM ~/Library/Preferences/com.microsoft.silverlight.plist
sudo $RM ~/Library/Preferences/com.microsoft.silverlight.plist.lockfile
sudo $RM ~/Library/Saved\ Application\ State/com.microsoft.silverlight.savedState

echo 'done'

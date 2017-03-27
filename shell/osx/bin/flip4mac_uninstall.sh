#!/usr/bin/env bash

# Uninstall Flip4Mac
# http://www.telestream.net/flip4mac/overview.htm


# Ask for the administrator password upfront.
echo 'ask for sudo'
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

sudo rm -vrfd /Library/Audio/Plug-Ins/Components/Flip4Mac\ WMA\ Import.component
sudo rm -vrfd /Library/Internet\ Plug-Ins/Flip4Mac\ WMV\ Plugin.plugin
sudo rm -vrfd /Library/PreferencePanes/Flip4Mac\ WMV.prefPane
sudo rm -vrfd /Library/QuickTime/Flip4Mac\ WMV\ Advanced.component
sudo rm -vrfd /Library/QuickTime/Flip4Mac\ WMV\ Export.component
sudo rm -vrfd /Library/QuickTime/Flip4Mac\ WMV\ Import.component

echo 'done'

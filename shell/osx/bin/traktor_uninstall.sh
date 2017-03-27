#!/usr/bin/env bash

# Uninstall Tracktor
# http://www.native-instruments.com/en/products/traktor/


# Ask for the administrator password upfront.
echo 'ask for sudo'
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

sudo rm -vrfd /Applications/Traktor
sudo rm -vrfd /Library/Application\ Support/Native\ Instruments
sudo rm -vrfd /Library/Audio/MIDI\ Devices/Native\ Instruments
sudo rm -vrfd /Library/Audio/MIDI Drivers/NIUSBMIDIDriver.plugin
sudo rm -vrfd /Library/Audio/MIDI Drivers/NIUSBTraktorKontrolX1MIDIDriver.plugin
sudo rm -vrfd /Library/PreferencePanes/NIUSBAudio.prefPane
sudo rm -vrfd /Library/Preferences/com.caiaq.Native\ Instruments.MIDI.PLIST

sudo rm -vrfd /Library/Preferences/com.native-instruments.Audio\ 2\ DJ\ Driver.plist
sudo rm -vrfd /Library/Preferences/com.native-instruments.Audio\ 4\ DJ\ Driver.plist
sudo rm -vrfd /Library/Preferences/com.native-instruments.Audio\ 8\ DJ\ Driver.plist
sudo rm -vrfd /Library/Preferences/com.native-instruments.Controller\ Editor.plist
sudo rm -vrfd /Library/Preferences/com.native-instruments.ServiceCenter.plist
sudo rm -vrfd /Library/Preferences/com.native-instruments.Traktor\ Kontrol\ X1\ Driver.plist
sudo rm -vrfd /Library/Preferences/com.native-instruments.Traktor\ Pro.plist

sudo rm -vrfd /System/Library/Extensions/NIUSBAudio2DJ.kext
sudo rm -vrfd /System/Library/Extensions/NIUSBAudio4DJ.kext
sudo rm -vrfd /System/Library/Extensions/NIUSBAudioDriver.kext
sudo rm -vrfd /System/Library/Extensions/NIUSBTraktorKontrolX1.kext

echo 'done'

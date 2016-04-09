#!/usr/bin/env bash

# http://www.native-instruments.com/en/products/traktor/


RM="rm -vrfd"

# Ask for the administrator password upfront.
echo 'ask for sudo'
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

sudo $RM /Applications/Traktor
sudo $RM /Library/Application\ Support/Native\ Instruments
sudo $RM /Library/Audio/MIDI\ Devices/Native\ Instruments
sudo $RM /Library/Audio/MIDI Drivers/NIUSBMIDIDriver.plugin
sudo $RM /Library/Audio/MIDI Drivers/NIUSBTraktorKontrolX1MIDIDriver.plugin
sudo $RM /Library/PreferencePanes/NIUSBAudio.prefPane
sudo $RM /Library/Preferences/com.caiaq.Native\ Instruments.MIDI.PLIST

sudo $RM /Library/Preferences/com.native-instruments.Audio\ 2\ DJ\ Driver.plist
sudo $RM /Library/Preferences/com.native-instruments.Audio\ 4\ DJ\ Driver.plist
sudo $RM /Library/Preferences/com.native-instruments.Audio\ 8\ DJ\ Driver.plist
sudo $RM /Library/Preferences/com.native-instruments.Controller\ Editor.plist
sudo $RM /Library/Preferences/com.native-instruments.ServiceCenter.plist
sudo $RM /Library/Preferences/com.native-instruments.Traktor\ Kontrol\ X1\ Driver.plist
sudo $RM /Library/Preferences/com.native-instruments.Traktor\ Pro.plist

sudo $RM /System/Library/Extensions/NIUSBAudio2DJ.kext
sudo $RM /System/Library/Extensions/NIUSBAudio4DJ.kext
sudo $RM /System/Library/Extensions/NIUSBAudioDriver.kext
sudo $RM /System/Library/Extensions/NIUSBTraktorKontrolX1.kext

echo 'done'

#!/usr/bin/env bash

# Install command-line tools using Homebrew.
# https://gist.github.com/TheFox/07f9077063e20a098001

BREW="brew"

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Exit when brew is not available.
which $BREW || exit 1

# Make sure we're using the latest Homebrew.
$BREW update

# Upgrade any already-installed formulae.
$BREW upgrade

# Install GNU core utilities (those that come with OS X are outdated).
# Don't forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
$BREW install coreutils
$BREW install binutils

$BREW install ack
#$BREW install ansible
$BREW install automake
$BREW install bash
$BREW install cmake
$BREW install curl
#$BREW install ffmpeg
$BREW install gpg2
$BREW install htop
$BREW install mutt
# $BREW install ninja
$BREW install nmap
$BREW install npm
$BREW install pstree
$BREW install rename
$BREW install tig
$BREW install tree
# $BREW install w3m
#$BREW install watch
$BREW install wget
$BREW install xz

$BREW install php56 --with-thread-safety --without-snmp
#$BREW install php56-mcrypt
#$BREW install php56-xdebug
$BREW install composer

$BREW install ruby
gem install -v 1.10.5 bundler
gem install -v 4.2.3 rails

which -a git
git --version
$BREW install git
which -a git
git --version

# $BREW install gnuplot --with-cairo --with-pdflib-lite --with-qt --with-x11

# brew install dbus
# cp /usr/local/Cellar/d-bus/1.8.8/org.freedesktop.dbus-session.plist ~/Library/LaunchAgents
# launchctl load -w ~/Library/LaunchAgents/org.freedesktop.dbus-session.plist

$BREW cleanup

sudo ln -s /usr/local/bin/grealpath /usr/local/bin/realpath
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum
sudo ln -s /usr/local/bin/gpg2 /usr/local/bin/gpg

# NodeJS

npm install -g json # json command-line tool


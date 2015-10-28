#!/usr/bin/env bash
# Install command-line tools using Homebrew.

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

$BREW install bash

$BREW install curl
$BREW install ffmpeg
$BREW install nmap
$BREW install pstree
$BREW install wget
$BREW install xz

$BREW install php55 --with-thread-safety --without-snmp
$BREW install php55-pthreads --without-snmp
$BREW install php55-mcrypt
$BREW install php55-xdebug
$BREW install composer

$BREW cleanup

sudo ln -s /usr/local/bin/grealpath /usr/local/bin/realpath
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

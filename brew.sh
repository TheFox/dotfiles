#!/usr/bin/env bash
# Install command-line tools using Homebrew.

INSTALL="install"

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we're using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated).
# Don't forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew $INSTALL coreutils
brew $INSTALL binutils

brew $INSTALL bash
brew $INSTALL wget
brew $INSTALL curl
brew $INSTALL nmap
brew $INSTALL xz
brew $INSTALL ffmpeg

brew $INSTALL php55 --with-thread-safety --without-snmp
brew $INSTALL php55-pthreads --without-snmp
brew $INSTALL php55-mcrypt
brew $INSTALL php55-xdebug

brew cleanup

sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

#!/usr/bin/env bash
# Install command-line tools using Homebrew.

BREW="brew"
BREW_FLAGS="install"

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Exit when brew is not available.
which $BREW || exit 1

# Make sure we're using the latest Homebrew.
$BREW update

# Upgrade any already-installed formulae.
$BREW upgrade

# Install GNU core utilities (those that come with OS X are outdated).
# Don't forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
$BREW $BREW_FLAGS coreutils
$BREW $BREW_FLAGS binutils

$BREW $BREW_FLAGS bash
$BREW $BREW_FLAGS wget
$BREW $BREW_FLAGS curl
$BREW $BREW_FLAGS nmap
$BREW $BREW_FLAGS xz
$BREW $BREW_FLAGS ffmpeg

$BREW $BREW_FLAGS php55 --with-thread-safety --without-snmp
$BREW $BREW_FLAGS php55-pthreads --without-snmp
$BREW $BREW_FLAGS php55-mcrypt
$BREW $BREW_FLAGS php55-xdebug
$BREW $BREW_FLAGS composer

$BREW cleanup

sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

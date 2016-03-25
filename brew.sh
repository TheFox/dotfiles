#!/usr/bin/env bash

# Install command-line tools using Homebrew.
# https://gist.github.com/TheFox/07f9077063e20a098001

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Exit when brew is not available.
which brew || exit 1

# Make sure we're using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated).
# Don't forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
brew install binutils

brew install ack
#brew install ansible
brew install automake
brew install bash
brew install cmake
brew install curl
#brew install ffmpeg
brew install gnu-sed
brew install gpg2
brew install htop
brew install mutt
# brew install ninja
brew install nmap
brew install npm
brew install pstree
brew install rename
brew install tig
brew install tree
# brew install w3m
#brew install watch
brew install wget
brew install xz

brew install php56 --with-thread-safety --without-snmp
#brew install php56-mcrypt
#brew install php56-xdebug
brew install composer

brew install ruby
gem install -v 1.10.5 bundler
gem install -v 4.2.3 rails

which -a git
git --version
brew install git
which -a git
git --version

# brew install gnuplot --with-cairo --with-pdflib-lite --with-qt --with-x11

# brew install dbus
# cp /usr/local/Cellar/d-bus/1.8.8/org.freedesktop.dbus-session.plist ~/Library/LaunchAgents
# launchctl load -w ~/Library/LaunchAgents/org.freedesktop.dbus-session.plist

brew install Caskroom/cask/firefox
#brew install Caskroom/cask/gimp
brew install Caskroom/cask/google-chrome

brew cleanup

sudo ln -s /usr/local/bin/grealpath /usr/local/bin/realpath
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum
sudo ln -s /usr/local/bin/gpg2 /usr/local/bin/gpg

# NodeJS

npm install -g json # json command-line tool


#!/usr/bin/env bash

# Install command-line tools using Homebrew.
# https://gist.github.com/TheFox/07f9077063e20a098001

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Exit when brew is not available.
which brew &> /dev/null || { echo 'brew not installed'; exit 1; }

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
#brew install git-flow
#brew install gnuplot --with-cairo --with-pdflib-lite --with-qt --with-x11
brew install gnu-sed
brew install gpg2
brew install gpg-agent
brew install htop
#brew install imagemagick
brew install mutt
# brew install ninja
brew install nmap
brew install npm
brew install pstree
brew install reattach-to-user-namespace # used by tmux
brew install rename
brew install tig
brew install tmux
brew install tree
# brew install w3m
brew install watch
brew install wget
brew install xz
#brew install youtube-dl

#brew install gettext
#brew link --force gettext

# PHP 5.5
# brew install php55 --with-thread-safety --without-snmp --with-imap --with-httpd24
# brew install php55-xdebug --build-from-source

# PHP 5.6
# brew install php56 --with-thread-safety --without-snmp --with-imap --with-httpd24
# brew install mcrypt --build-from-source php56-mcrypt --build-from-source
# brew install php56-xdebug --build-from-source

# PHP 7.1
# brew install php71 --with-thread-safety --with-imap --with-httpd24
# brew install mcrypt --build-from-source php71-mcrypt --build-from-source
# brew install php71-xdebug --build-from-source

brew install composer

# DBUS
# brew install dbus
# cp /usr/local/Cellar/d-bus/1.8.8/org.freedesktop.dbus-session.plist ~/Library/LaunchAgents
# Load DBus
# launchctl load -w ~/Library/LaunchAgents/org.freedesktop.dbus-session.plist

brew install ruby
gem install bundler
gem install tmuxinator

# Git
which -a git
git --version
brew install git
which -a git
git --version

# brew install gnuplot --with-cairo --with-pdflib-lite --with-qt --with-x11

# brew install dbus
# cp /usr/local/Cellar/d-bus/1.8.8/org.freedesktop.dbus-session.plist ~/Library/LaunchAgents
# launchctl load -w ~/Library/LaunchAgents/org.freedesktop.dbus-session.plist

brew tap caskroom/cask
#brew cask install adium
#brew cask install datagrip
brew cask install dropbox
brew cask install firefox
brew cask install forklift
#brew cask install gimp
brew cask install google-chrome
brew cask install kaleidoscope
brew cask install keepassx
brew cask install libreoffice
#brew cask install limechat
#brew cask install mysqlworkbench
#brew cask install sequel-pro
#brew cask install skype
brew cask install sublime-text
brew cask install the-unarchiver
brew cask install thunderbird
brew cask install tunnelblick
#brew cask install virtualbox
#brew cask install vlc
#brew cask install wkhtmltopdf
#brew cask install xquartz


brew cleanup


# Not used anymore because in coreutils 8.25 grealpath is
# already linked to /usr/local/bin/realpath.
# sudo ln -s /usr/local/bin/grealpath /usr/local/bin/realpath 

# From coreutils, all bins starting with a 'g'. GNU.
sudo ln -s /usr/local/bin/gsed /usr/local/bin/sed
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum
sudo ln -s /usr/local/bin/gpg2 /usr/local/bin/gpg


# NodeJS
npm install -g json # json command-line tool

#!/usr/bin/env bash

brew install php56 --with-thread-safety --without-snmp --with-imap --with-httpd24
brew install mcrypt --build-from-source php56-mcrypt --build-from-source
brew install php56-xdebug --build-from-source

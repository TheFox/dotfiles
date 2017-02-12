#!/usr/bin/env bash

# 2015-01-13 https://gist.github.com/TheFox/efb21bb9ed6ff4f2a725

# https://code.google.com/p/cardpeek/
# You also need to install DBus.

# Install 'gnome-icon-theme' for GTK+ 3.
brew install gnome-icon-theme

# Check out the source.
svn checkout http://cardpeek.googlecode.com/svn/trunk/ cardpeek
cd cardpeek

# Create files for compiling.
autoreconf -fi

# './configure' may fail with
#   Package 'xyz', required by 'abc', not found
# So we need to set the path for PkgConfig.
export PKG_CONFIG_PATH=/opt/X11/lib/pkgconfig
./configure

# Compile.
make

# Alternatively you can install
# cardpeek into your system.
#make install

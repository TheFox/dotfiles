#!/usr/bin/env bash

# Compile Cardpeek
# 2015-01-13 https://gist.github.com/TheFox/efb21bb9ed6ff4f2a725
# 2017-02-12 https://github.com/TheFox/dotfiles/blob/3bf969a039f91d0aa6d245fe72dedf7341e03db9/shell/osx/bin/cardpeek_compile.sh

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

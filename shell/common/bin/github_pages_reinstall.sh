#!/usr/bin/env bash

# Reinstall Jekyll

# https://rubygems.org/gems/github-pages
# https://rubygems.org/gems/redcarpet

set -e

GITHUB_PAGES_VERSION=124
REDCARPET_VERSION=3.4.0

# Uninstall
gem uninstall github-pages --all --executables --ignore-dependencies || true

# Install GitHub Pages
gem install github-pages -v ${GITHUB_PAGES_VERSION}

# Install Redcarpet
gem install redcarpet -v ${REDCARPET_VERSION}

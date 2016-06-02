#!/usr/bin/env bash

# Reinstall Jekyll

# https://rubygems.org/gems/github-pages
# https://rubygems.org/gems/redcarpet

set -e

function list(){
	for gem_name in github-pages-health-check jekyll jekyll-coffeescript jekyll-feed jekyll-gist jekyll-github-metadata jekyll-mentions jekyll-paginate jekyll-redirect-from jekyll-sass-converter jekyll-seo-tag jekyll-sitemap jemoji kramdown liquid listen mercenary rouge terminal-table; do
		echo $gem_name
		sudo gem list --local $gem_name || true
		#sudo gem uninstall $gem_name -a -x -I
	done
}

#list; exit

sudo gem list --local github-pages || true
echo '------'
echo

echo 'INSTALL'
sudo gem uninstall github-pages -a -x -I
sudo gem install github-pages -v 78
sudo gem install redcarpet -v 3.3.3

echo '------'
echo
list
sudo gem list --local github-pages

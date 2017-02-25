#!/usr/bin/env bash

# Upgrade a Wordpress installation to a newer version.

# 2010-01-09 Created by Christian Mayer <https://fox21.at>
# 2013-09-06 https://gist.github.com/TheFox/6458070
# 2017-02-12 https://github.com/TheFox/dotfiles/blob/df9bfd6da9a7054ef66b27f7ac5b089b09fb0862/shell/common/bin/wordpress_update.sh

VERSION_OLD="2.9"
VERSION_NEW="2.9.1"
THEME="inove"

cp -ruv --preserve=all ./wordpress-$VERSION_OLD/.htaccess ./wordpress-$VERSION_NEW
cp -ruv --preserve=all ./wordpress-$VERSION_OLD/sitemap.xml ./wordpress-$VERSION_NEW
cp -ruv --preserve=all ./wordpress-$VERSION_OLD/sitemap.xml.gz ./wordpress-$VERSION_NEW
cp -ruv --preserve=all ./wordpress-$VERSION_OLD/wp-config.php ./wordpress-$VERSION_NEW
cp -ruv --preserve=all ./wordpress-$VERSION_OLD/wp-content/plugins/* ./wordpress-$VERSION_NEW/wp-content/plugins
cp -ruv --preserve=all ./wordpress-$VERSION_OLD/wp-content/themes/$THEME ./wordpress-$VERSION_NEW/wp-content/themes
cp -ruv --preserve=all ./wordpress-$VERSION_OLD/wp-content/advanced-cache.php ./wordpress-$VERSION_NEW/wp-content
cp -ruv --preserve=all ./wordpress-$VERSION_OLD/wp-content/wp-cache-config.php ./wordpress-$VERSION_NEW/wp-content
cp -ruv --preserve=all ./wordpress-$VERSION_OLD/wp-content/cache ./wordpress-$VERSION_NEW/wp-content

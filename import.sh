#!/usr/bin/env bash

#DATE=$(date +"%Y-%m-%d %H:%M:%S %z")
SCRIPT_BASEDIR=$(dirname $0)
CP="cp"
MV="mv"
RSYNC="rsync -rupt"
MKDIR="mkdir -p"


set -e
cd $SCRIPT_BASEDIR

un=$(uname -s)
script_name="linux"
if [ "$un" = "Darwin" ]; then
	script_name="macosx"
fi

echo 'remove old files'
rm -f ~/bin/changelog.sh
rm -f ~/bin/functions.sh
rm -f ~/bin/functions-inc.sh
rm -f ~/bin/release
rm -f ~/bin/gpg-agent-start
rm -f ~/bin/divx-uninstall.sh
rm -f ~/bin/fish-uninstall.sh
rm -f ~/bin/flip4mac-uninstall.sh
rm -f ~/bin/ghostscript-uninstall.sh
rm -f ~/bin/silverlight-uninstall.sh
rm -f ~/bin/tex-uninstall.sh
rm -f ~/bin/traktor-uninstall.sh
rm -f ~/bin/route-192.sh
rm -f ~/bin/route-iphone.sh
rm -f ~/bin/route-normal.sh
rm -f ~/bin/bitmessage
rm -f ~/bin/homecleanup.sh
rm -f ~/bin/lowprio.sh
rm -f ~/bin/route_192.sh
rm -f ~/bin/route_iphone.sh
rm -f ~/bin/route_normal.sh
rm -f ~/.dotfiles-installed
rm -f ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/PHP/codingStandardsIgnore-10.sublime-snippet
rm -f ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/PHP/codingStandardsIgnore-20.sublime-snippet
rm -f ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/PHP/codingStandardsIgnore-30.sublime-snippet
rm -f ~/bin/mirrors_add
rm -f ~/bin/install_php55.sh
rm -f ~/bin/install_php56.sh
rm -f ~/bin/install_php71.sh
rm -f ~/bin/gzipc
rm -f ~/bin/gpggz2gpgxz
rm -f ~/bin/gource.sh
rm -f ~/bin/flac2mp3
rm -f ~/bin/clock
rm -f ~/bin/ckcon
rm -f ~/bin/jekyll_reinstall.sh
rm -f ~/bin/japh.pl
rm -f ~/bin/wordpress_update.sh
rm -f ~/bin/new_processes
rm -f ~/bin/mp3rn
rm -f ~/bin/notify
rm -f ~/bin/cardpeek_compile.sh
rm -f ~/bin/gpgf
rm -f ~/bin/pm
rm -f ~/bin/rar100
rm -f ~/bin/rar100s
rm -f ~/bin/unrarpwd.sh
rm -f ~/bin/showenv
rm -f ~/bin/showenvpath
rm -f ~/bin/sshi
rm -f ~/bin/upload
# rm -f ~/bin/psg # deprecated
# rm -f ~/bin/root # deprecated


echo 'import default files'
for file in $(cat .files); do
	$RSYNC $file $HOME/ || echo failed
	true
done

if [[ ! -d $HOME/bin ]]; then
	$MKDIR $HOME/bin
fi

$RSYNC shell/common/bin/* $HOME/bin/
$RSYNC gpg/ $HOME/.gnupg/

echo "script_name: '${script_name}'"
./import_${script_name}.sh

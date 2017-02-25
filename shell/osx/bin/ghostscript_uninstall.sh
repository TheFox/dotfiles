#!/usr/bin/env bash

# Uninstall Ghostscript

# See 'Uninstalling Ghostscript' on
#   https://www.tug.org/mactex/uninstalling.html


RM="rm -rfd"
LS="ls -lad"
DIRS="/usr/local/share/ghostscript"
FILES="/usr/local/bin/dvipdf /usr/local/bin/eps2eps /usr/local/bin/font2c /usr/local/bin/gs-X11 /usr/local/bin/gs-X11-64Bit /usr/local/bin/gs-X11-Yosemite /usr/local/bin/gs-noX11 /usr/local/bin/gs-noX11-64Bit /usr/local/bin/gs-noX11-Yosemite /usr/local/bin/gsbj /usr/local/bin/gsdj /usr/local/bin/gsdj500 /usr/local/bin/gslj /usr/local/bin/gslp /usr/local/bin/gsnd /usr/local/bin/lprsetup.sh /usr/local/bin/pdf2dsc /usr/local/bin/pdf2ps /usr/local/bin/pf2afm /usr/local/bin/pfbtopfa /usr/local/bin/pphs /usr/local/bin/printafm /usr/local/bin/ps2ascii /usr/local/bin/ps2epsi /usr/local/bin/ps2pdf /usr/local/bin/ps2pdf12 /usr/local/bin/ps2pdf13 /usr/local/bin/ps2pdf14 /usr/local/bin/ps2pdfwr /usr/local/bin/ps2ps /usr/local/bin/ps2ps2 /usr/local/bin/unix-lpr.sh /usr/local/bin/wftopfa"
MAN_FILES_DE="/usr/local/share/man/de/man1/dvipdf.1 /usr/local/share/man/de/man1/eps2eps.1 /usr/local/share/man/de/man1/font2c.1 /usr/local/share/man/de/man1/gsnd.1 /usr/local/share/man/de/man1/pdf2dsc.1 /usr/local/share/man/de/man1/pdf2ps.1 /usr/local/share/man/de/man1/printafm.1 /usr/local/share/man/de/man1/ps2ascii.1 /usr/local/share/man/de/man1/ps2pdf.1 /usr/local/share/man/de/man1/ps2pdf12.1 /usr/local/share/man/de/man1/ps2pdf13.1 /usr/local/share/man/de/man1/ps2pdf14.1 /usr/local/share/man/de/man1/ps2ps.1 /usr/local/share/man/de/man1/wftopfa.1"
MAN_FILES_C="/usr/local/share/man/man1/dvipdf.1 /usr/local/share/man/man1/eps2eps.1 /usr/local/share/man/man1/font2c.1 /usr/local/share/man/man1/gs.1 /usr/local/share/man/man1/gsbj.1 /usr/local/share/man/man1/gsdj.1 /usr/local/share/man/man1/gsdj500.1 /usr/local/share/man/man1/gslj.1 /usr/local/share/man/man1/gslp.1 /usr/local/share/man/man1/gsnd.1 /usr/local/share/man/man1/pdf2dsc.1 /usr/local/share/man/man1/pdf2ps.1 /usr/local/share/man/man1/pf2afm.1 /usr/local/share/man/man1/pfbtopfa.1 /usr/local/share/man/man1/printafm.1 /usr/local/share/man/man1/ps2ascii.1 /usr/local/share/man/man1/ps2epsi.1 /usr/local/share/man/man1/ps2pdf.1 /usr/local/share/man/man1/ps2pdf12.1 /usr/local/share/man/man1/ps2pdf13.1 /usr/local/share/man/man1/ps2pdf14.1 /usr/local/share/man/man1/ps2pdfwr.1 /usr/local/share/man/man1/ps2ps.1 /usr/local/share/man/man1/wftopfa.1"

# Ask for the administrator password upfront.
echo 'ask for sudo'
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#set -x

for dir in $DIRS; do
	( $LS $dir 2> /dev/null; [ -d $dir ] && echo sudo $RM $dir )
done

for file in $FILES $MAN_FILES_DE $MAN_FILES_C; do
	( $LS $file 2> /dev/null; [ -f $file ] && sudo $RM $file )
done

echo 'done'

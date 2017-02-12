#!/usr/bin/env bash

# Create Bootable ISO from Mavericks App
# Original: http://thezinx.com/2013/10/29/create-bootable-dmg-iso-mavericks-app.html
# 2014-01-06 https://gist.github.com/TheFox/8281265

V_BUILD=/Volumes/install_build
V_APP=/Volumes/install_app
T_SI_B=/tmp/mavericks

T_SI=$T_SI_B.sparseimage

# Mount the installer image
hdiutil attach /Applications/Install\ OS\ X\ Mavericks.app/Contents/SharedSupport/InstallESD.dmg -noverify -nobrowse -mountpoint $V_APP

# Convert the boot image to a sparse bundle
hdiutil convert $V_APP/BaseSystem.dmg -format UDSP -o $T_SI_B

# Increase the sparse bundle capacity to accommodate the packages
hdiutil resize -size 8g $T_SI

# Mount the sparse bundle for package addition
hdiutil attach $T_SI -noverify -nobrowse -mountpoint $V_BUILD

# Remove Package link and replace with actual files
rm -v $V_BUILD/System/Installation/Packages
cp -vrp $V_APP/Packages $V_BUILD/System/Installation/

# Unmount the installer image
hdiutil detach $V_APP

# Unmount the sparse bundle
hdiutil detach $V_BUILD

# Resize the partition in the sparse bundle to remove any free space
hdiutil resize -size $(hdiutil resize -limits $T_SI | tail -n 1 | awk '{ print $1 }')b $T_SI

# Convert the sparse bundle to ISO/CD master
hdiutil convert $T_SI -format UDTO -o $T_SI_B

# Remove the sparse bundle
rm -v $T_SI

# Rename the ISO and move it to the desktop
mv -v $T_SI_B.cdr ~/Desktop/macosx.iso

echo 'done'

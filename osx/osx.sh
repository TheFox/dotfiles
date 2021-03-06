#!/usr/bin/env bash

# Set up macOS.

DATE=$(date +"%Y%m%d-%H%M%S")
LOG="old_${DATE}.log"


echo > "${LOG}"
date >> "${LOG}"

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


echo root
sudo chsh -s /bin/bash

echo 'create ~/tmp'
mkdir -p ~/tmp

echo screenshot
# Screenshot: Change the location
defaults read com.apple.screencapture location >> "${LOG}"
defaults write com.apple.screencapture location ~/tmp

# Screenshot: Change the File Format
defaults read com.apple.screencapture type >> "${LOG}"
defaults write com.apple.screencapture type png

# Screenshot: Disable shadows
defaults read com.apple.screencapture disable-shadow >> "${LOG}"
defaults write com.apple.screencapture disable-shadow -bool true

echo


echo finder

# Always open everything in Finder's list view. This is important.
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`.
defaults read com.apple.Finder FXPreferredViewStyle >> "${LOG}"
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Set a really fast key repeat.
#defaults read NSGlobalDomain KeyRepeat
#defaults write NSGlobalDomain KeyRepeat -int 0

# Disable Finder prefs for showing a few different volumes on the Desktop.
#defaults read com.apple.finder ShowExternalHardDrivesOnDesktop
#defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
#defaults read com.apple.finder ShowRemovableMediaOnDesktop
#defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# Run the screensaver if we're in the bottom-left hot corner.
#defaults write com.apple.dock wvous-bl-corner -int 5
#defaults write com.apple.dock wvous-bl-modifier -int 0

# Finder: disable window animations and Get Info animations
defaults read com.apple.finder DisableAllAnimations >> "${LOG}"
defaults write com.apple.finder DisableAllAnimations -bool true

# Finder: show all filename extensions
defaults read NSGlobalDomain AppleShowAllExtensions >> "${LOG}"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults read com.apple.finder ShowStatusBar >> "${LOG}"
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults read com.apple.finder ShowPathbar >> "${LOG}"
defaults write com.apple.finder ShowPathbar -bool true

# Finder: allow text selection in Quick Look
#defaults read com.apple.finder QLEnableTextSelection
#defaults write com.apple.finder QLEnableTextSelection -bool true

# Display full POSIX path as Finder window title
#defaults read com.apple.finder _FXShowPosixPathInTitle
#defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# When performing a search, search the current folder by default
defaults read com.apple.finder FXDefaultSearchScope >> "${LOG}"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults read com.apple.finder FXEnableExtensionChangeWarning >> "${LOG}"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Disable spring loading for directories
defaults read NSGlobalDomain com.apple.springing.enabled >> "${LOG}"
defaults write NSGlobalDomain com.apple.springing.enabled -bool false

# Disable spring loading for all Dock items
#defaults read com.apple.dock enable-spring-load-actions-on-all-items
#defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool false

# Avoid creating .DS_Store files on network volumes
defaults read com.apple.desktopservices DSDontWriteNetworkStores >> "${LOG}"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Disable disk image verification
defaults read com.apple.frameworks.diskimages skip-verify >> "${LOG}"
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults read com.apple.frameworks.diskimages skip-verify-locked >> "${LOG}"
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults read com.apple.frameworks.diskimages skip-verify-remote >> "${LOG}"
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Automatically open a new Finder window when a volume is mounted
defaults read com.apple.frameworks.diskimages auto-open-ro-root >> "${LOG}"
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool false
defaults read com.apple.frameworks.diskimages auto-open-rw-root >> "${LOG}"
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool false
defaults read com.apple.finder OpenWindowForNewRemovableDisk >> "${LOG}"
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool false

# Disable the warning before emptying the Trash
defaults read com.apple.finder WarnOnEmptyTrash >> "${LOG}"
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Empty Trash securely
defaults read com.apple.finder EmptyTrashSecurely >> "${LOG}"
defaults write com.apple.finder EmptyTrashSecurely -bool false

# Enable AirDrop over Ethernet and on unsupported Macs running Lion
#defaults read com.apple.NetworkBrowser BrowseAllInterfaces
#defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool false

# Set the icon size of Dock items to 26 pixels
defaults read com.apple.dock tilesize >> "${LOG}"
defaults write com.apple.dock tilesize -int 26

# Change minimize/maximize window effect
defaults read com.apple.dock mineffect >> "${LOG}"
defaults write com.apple.dock mineffect -string "scale"

# Minimize windows into their application's icon
#defaults read com.apple.dock minimize-to-application >> "${LOG}"
#defaults write com.apple.dock minimize-to-application -bool false

# Don't animate opening applications from the Dock
defaults read com.apple.dock launchanim >> "${LOG}"
defaults write com.apple.dock launchanim -bool false

# Wipe all (default) app icons from the Dock
# This is only really useful when setting up a new Mac, or if you don't use
# the Dock to launch apps.
#defaults write com.apple.dock persistent-apps -array ""

# Show Dashboard as a Space
defaults read com.apple.dock dashboard-in-overlay >> "${LOG}"
defaults write com.apple.dock dashboard-in-overlay -bool false

# Don't automatically rearrange Spaces based on most recent use
defaults read com.apple.dock mru-spaces >> "${LOG}"
defaults write com.apple.dock mru-spaces -bool false

# Remove the auto-hiding Dock delay
defaults read com.apple.dock autohide-delay >> "${LOG}"
defaults write com.apple.dock autohide-delay -float 0

# Remove the animation when hiding/showing the Dock
defaults read com.apple.dock autohide-time-modifier >> "${LOG}"
defaults write com.apple.dock autohide-time-modifier -float 0

# Automatically hide and show the Dock
defaults read com.apple.dock autohide >> "${LOG}"
defaults write com.apple.dock autohide -bool true

# Make Dock icons of hidden applications translucent
#defaults write com.apple.dock showhidden -bool true

# Reset Launchpad, but keep the desktop wallpaper intact
#find "${HOME}/Library/Application Support/Dock" -name "*-*.db" -maxdepth 1 -delete
echo


###############################################################################
# Safari & WebKit                                                             #
###############################################################################

#echo safari

# Privacy: don't send search queries to Apple
#defaults write com.apple.Safari UniversalSearchEnabled -bool false
#defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Press Tab to highlight each item on a web page
#defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true
#defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true

# Show the full URL in the address bar (note: this still hides the scheme)
#defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Set Safari's home page to `about:blank` for faster loading
#defaults write com.apple.Safari HomePage -string "about:blank"

# Prevent Safari from opening 'safe' files automatically after downloading
#defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Allow hitting the Backspace key to go to the previous page in history
#defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

# Hide Safari's bookmarks bar by default
#defaults write com.apple.Safari ShowFavoritesBar -bool false

# Hide Safari's sidebar in Top Sites
#defaults write com.apple.Safari ShowSidebarInTopSites -bool false

# Disable Safari's thumbnail cache for History and Top Sites
#defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

# Enable Safari's debug menu
#defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Make Safari's search banners default to Contains instead of Starts With
#defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Remove useless icons from Safari's bookmarks bar
#defaults write com.apple.Safari ProxiesInBookmarksBar "()"

# Enable the Develop menu and the Web Inspector in Safari
#defaults write com.apple.Safari IncludeDevelopMenu -bool true
#defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
#defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Add a context menu item for showing the Web Inspector in web views
#defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

#echo


###############################################################################
# Mail                                                                        #
###############################################################################

#echo mail

# Disable send and reply animations in Mail.app
#defaults write com.apple.mail DisableReplyAnimations -bool true
#defaults write com.apple.mail DisableSendAnimations -bool true

# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
#defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Add the keyboard shortcut ⌘ + Enter to send an email in Mail.app
#defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" -string "@\\U21a9"

# Display emails in threaded mode, sorted by date (oldest at the top)
#defaults write com.apple.mail DraftsViewerAttributes -dict-add "DisplayInThreadedMode" -string "yes"
#defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortedDescending" -string "yes"
#defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortOrder" -string "received-date"

# Disable inline attachments (just show the icons)
#defaults write com.apple.mail DisableInlineAttachmentViewing -bool true

# Disable automatic spell checking
#defaults write com.apple.mail SpellCheckingBehavior -string "NoSpellCheckingEnabled"

#echo


###############################################################################
# Spotlight                                                                   #
###############################################################################

## echo spotlight

# Disable Spotlight indexing for any volume that gets mounted and has not yet
# been indexed before.
# Use `sudo mdutil -i off "/Volumes/foo"` to stop indexing any volume.
##sudo defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array "/Volumes"

# Change indexing order and disable some search results
# Yosemite-specific search results (remove them if your are using OS X 10.9 or older):
# 	MENU_DEFINITION
# 	MENU_CONVERSION
# 	MENU_EXPRESSION
# 	MENU_SPOTLIGHT_SUGGESTIONS (send search queries to Apple)
# 	MENU_WEBSEARCH             (send search queries to Apple)
# 	MENU_OTHER
## defaults write com.apple.spotlight orderedItems -array \
# 	'{"enabled" = 1;"name" = "MENU_EXPRESSION";}' \
# 	'{"enabled" = 1;"name" = "APPLICATIONS";}' \
# 	'{"enabled" = 1;"name" = "DOCUMENTS";}' \
# 	'{"enabled" = 1;"name" = "DIRECTORIES";}' \
# 	'{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
# 	'{"enabled" = 0;"name" = "PDF";}' \
# 	'{"enabled" = 0;"name" = "FONTS";}' \
# 	'{"enabled" = 0;"name" = "MESSAGES";}' \
# 	'{"enabled" = 0;"name" = "CONTACT";}' \
# 	'{"enabled" = 0;"name" = "EVENT_TODO";}' \
# 	'{"enabled" = 0;"name" = "IMAGES";}' \
# 	'{"enabled" = 0;"name" = "BOOKMARKS";}' \
# 	'{"enabled" = 0;"name" = "MUSIC";}' \
# 	'{"enabled" = 0;"name" = "MOVIES";}' \
# 	'{"enabled" = 0;"name" = "PRESENTATIONS";}' \
# 	'{"enabled" = 0;"name" = "SPREADSHEETS";}' \
# 	'{"enabled" = 0;"name" = "SOURCE";}' \
# 	'{"enabled" = 0;"name" = "MENU_DEFINITION";}' \
# 	'{"enabled" = 0;"name" = "MENU_OTHER";}' \
# 	'{"enabled" = 0;"name" = "MENU_CONVERSION";}' \
# 	'{"enabled" = 0;"name" = "MENU_WEBSEARCH";}' \
# 	'{"enabled" = 0;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}'

# Load new settings before rebuilding the index
#killall mds > /dev/null 2>&1

# Make sure indexing is enabled for the main volume
#sudo mdutil -i on / > /dev/null

# Rebuild the index from scratch
#sudo mdutil -E / > /dev/null


###############################################################################
# Time Machine                                                                #
###############################################################################

# Prevent Time Machine from prompting to use new hard drives as backup volume
#defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Disable local Time Machine backups
#hash tmutil &> /dev/null && sudo tmutil disablelocal


###############################################################################
# Activity Monitor                                                            #
###############################################################################

#echo activity monitor

# Show the main window when launching Activity Monitor
#defaults read com.apple.ActivityMonitor OpenMainWindow
#defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Visualize Activity Monitor Dock icon
#defaults read com.apple.ActivityMonitor IconType
#defaults write com.apple.ActivityMonitor IconType -int 2

# Show all processes in Activity Monitor
#defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
#defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
#defaults write com.apple.ActivityMonitor SortDirection -int 0

#echo


###############################################################################
# Mac App Store                                                               #
###############################################################################

#echo store
# Enable the WebKit Developer Tools in the Mac App Store
#defaults write com.apple.appstore WebKitDeveloperExtras -bool true

# Enable Debug Menu in the Mac App Store
#defaults write com.apple.appstore ShowDebugMenu -bool true

#echo


###############################################################################
# Messages                                                                    #
###############################################################################

##echo messages

# Disable automatic emoji substitution (i.e. use plain text smileys)
#defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false

# Disable smart quotes as it's annoying for messages that contain code
#defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false

# Disable continuous spell checking
#defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool false

##echo


###############################################################################
# Google Chrome & Google Chrome Canary                                        #
###############################################################################

echo chrome

# Disable the all too sensitive backswipe
#defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
#defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false

# Change update interval to 2 days.
# https://support.google.com/a/answer/187207?hl=en&topic=1064255
# https://support.google.com/installer/answer/147176
defaults read com.google.Keystone.Agent checkInterval >> "${LOG}"
defaults write com.google.Keystone.Agent checkInterval 172800

# Use the system-native print preview dialog
##defaults write com.google.Chrome DisablePrintPreview -bool true
##defaults write com.google.Chrome.canary DisablePrintPreview -bool true

echo


###############################################################################
# Address Book, Dashboard, iCal, TextEdit, and Disk Utility                   #
###############################################################################

echo misc

# Enable the debug menu in iCal (pre-10.8)
#defaults write com.apple.iCal IncludeDebugMenu -bool true

# Use plain text mode for new TextEdit documents
defaults read com.apple.TextEdit RichText >> "${LOG}"
defaults write com.apple.TextEdit RichText -int 0

# Open and save files as UTF-8 in TextEdit
#defaults write com.apple.TextEdit PlainTextEncoding -int 4
#defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

# Enable the debug menu in Disk Utility
#defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
#defaults write com.apple.DiskUtility advanced-image-options -bool true

# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
#sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Show the ~/Library folder.
#chflags nohidden ~/Library

echo


echo network

# List all Mac's network interfaces
sudo networksetup -listallnetworkservices >> "${LOG}"

# Disable IPv6 for Wireless
sudo networksetup -setv6off Wi-Fi

# Disable IPv6 for Ethernet
#sudo networksetup -setv6off Ethernet &> /dev/null

# Re-enable IPv6, use -setv6automatic instead
#sudo networksetup -setv6automatic Wi-Fi &> /dev/null
#sudo networksetup -setv6automatic WLAN &> /dev/null
#sudo networksetup -setv6automatic Ethernet &> /dev/null

echo


# Some commands needs a system reboot or
#killall SystemUIServer

echo 'done. you must now restart your mac'

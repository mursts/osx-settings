###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

## Remap Caps Lock key to Control
keyboardid=$(ioreg -n IOHIDKeyboard -r | grep -E 'VendorID"|ProductID' | awk '{ print $4 }' | paste -s -d'-\n' -)'-0'
defaults -currentHost delete -g com.apple.keyboard.modifiermapping.${keyboardid}
defaults -currentHost write -g com.apple.keyboard.modifiermapping.${keyboardid} -array-add '<dict><key>HIDKeyboardModifierMappingDst</key><integer>4</integer><key>HIDKeyboardModifierMappingSrc</key><integer>0</integer></dict>'
# None — –1
# Caps Lock — 0
# Shift (Left) — 1
# Control (Left) — 2
# Option (Left) — 3
# Command (Left) — 4
# Keypad 0 — 5
# Help — 6
# Shift (Right) — 9
# Control (Right) — 10
# Option (Right) — 11
# Command (Right) — 12

# Function key is standard function key
defaults write -g com.apple.keyboard.fnState -bool false

# Full keyboard access
defaults write -g AppleKeyboardUIMode -int 3

###############################################################################
# Screen                                                                      #
###############################################################################

# Save screenshots to the desktop
mkdir ${HOME}/Screenshot
defaults write com.apple.screencapture location -string "${HOME}/Screenshot"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Enable subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2

###############################################################################
# Finder                                                                      #
###############################################################################

# Set Home as the default location for new Finder windows
# For other paths, use `PfLo` and `file:///full/path/here/`
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Show icons for hard drives and servers on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Use column view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# System directory in English
cd /System/Library/CoreServices/SystemFolderLocalizations/ja.lproj
sudo mv SystemFolderLocalizations.strings SystemFolderLocalizations.strings.back
sudo cp ../en.lproj/SystemFolderLocalizations.strings .
killall Finder
cd

###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true



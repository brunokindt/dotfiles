echo "Show percentage in battery status"
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
defaults write com.apple.menuextra.battery ShowTime -string "NO"

echo "Show Path bar in Finder"
defaults write com.apple.finder ShowPathbar -bool true

echo "Show the ~/Library folder"
chflags nohidden ~/Library

echo "Hide dock automatically"
defaults write com.apple.dock autohide -boolean true

echo "Show all filename extensions in Finder"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "Disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo "Disable user interface sound effects"
defaults write com.apple.systemsound 'com.apple.sound.uiaudio.enabled' -int 0



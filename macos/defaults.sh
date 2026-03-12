#!/bin/bash
# ============================================================
# 🍎 macOS System Defaults
# تنظیمات سیستمی macOS
# Usage: bash ~/.dotfiles/macos/defaults.sh
# ============================================================

echo "⚙️  Applying macOS defaults..."

# --------------------------------------------------
# 🖥️ Dock
# --------------------------------------------------
# Dock سمت چپ
defaults write com.apple.dock orientation -string "left"
# سایز آیکون‌ها
defaults write com.apple.dock tilesize -integer 35
# Magnification روشن
defaults write com.apple.dock magnification -bool true
# سایز بزرگ‌شده
defaults write com.apple.dock largesize -integer 85
# Auto-hide خاموش
defaults write com.apple.dock autohide -bool false
# افکت minimize
defaults write com.apple.dock mineffect -string "genie"
# نشون ندادن اپ‌های اخیر
defaults write com.apple.dock show-recents -bool false
# سرعت Mission Control
defaults write com.apple.dock expose-animation-duration -float 0.12

# --------------------------------------------------
# 📂 Finder
# --------------------------------------------------
# نمایش path bar
defaults write com.apple.finder ShowPathbar -bool true
# نمایش status bar
defaults write com.apple.finder ShowStatusBar -bool true
# نمایش تمام پسوند فایل‌ها
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# نشون ندادن اخطار تغییر پسوند
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# جستجو در پوشه فعلی بجای کل مک
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# جلوگیری از ساخت .DS_Store روی شبکه و USB
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# --------------------------------------------------
# ⌨️ Keyboard
# --------------------------------------------------
# سرعت تکرار کلید (عالی برای کدنویسی)
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15
# غیرفعال کردن auto-correct و smart features
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# --------------------------------------------------
# 💾 General UI/UX
# --------------------------------------------------
# expand save/print panels by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
# ذخیره روی دیسک بجای iCloud
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# --------------------------------------------------
# 📸 Screenshots
# --------------------------------------------------
# ذخیره اسکرین‌شات توی پوشه مشخص
mkdir -p "$HOME/Screenshots"
defaults write com.apple.screencapture location "$HOME/Screenshots"
# بدون سایه
defaults write com.apple.screencapture disable-shadow -bool true
# فرمت PNG
defaults write com.apple.screencapture type -string "png"

# --------------------------------------------------
# 🖱️ Hot Corners
# --------------------------------------------------
# گوشه بالا-چپ → Mission Control
defaults write com.apple.dock wvous-tl-corner -int 2
defaults write com.apple.dock wvous-tl-modifier -int 0
# گوشه پایین-راست → Desktop
defaults write com.apple.dock wvous-br-corner -int 4
defaults write com.apple.dock wvous-br-modifier -int 0

# --------------------------------------------------
# 🔄 Restart affected apps
# --------------------------------------------------
echo "🔄 Restarting Dock and Finder..."
killall Dock
killall Finder
killall SystemUIServer 2>/dev/null

echo ""
echo "✅ macOS defaults applied!"
echo "⚠️  برخی تنظیمات نیاز به logout/restart دارن."

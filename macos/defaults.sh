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

# --------------------------------------------------
# 📂 Finder
# --------------------------------------------------
# نمایش path bar
defaults write com.apple.finder ShowPathbar -bool true
# نمایش status bar
defaults write com.apple.finder ShowStatusBar -bool true
# نمایش تمام پسوند فایل‌ها
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# --------------------------------------------------
# 🔄 Restart affected apps
# --------------------------------------------------
echo "🔄 Restarting Dock and Finder..."
killall Dock
killall Finder

echo ""
echo "✅ macOS defaults applied!"
echo "⚠️  برخی تنظیمات نیاز به logout/restart دارن."

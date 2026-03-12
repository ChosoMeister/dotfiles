#!/bin/bash
# ============================================================
# 🖥️ Mustafa's macOS Fresh Install Setup
# Author: Mustafa
# Last Updated: 2026-03-12
#
# Usage:
#   git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/.dotfiles
#   cd ~/.dotfiles
#   bash install.sh
# ============================================================

set -e

DOTFILES_DIR="$HOME/.dotfiles"
echo ""
echo "=============================================="
echo "  🚀 Mustafa's macOS Setup Script"
echo "=============================================="
echo ""

# --------------------------------------------------
# 📌 Pre-requisites
# --------------------------------------------------
echo "📌 Step 1: Pre-requisites..."

# Xcode Command Line Tools
if ! xcode-select -p &>/dev/null; then
    echo "  → Installing Xcode Command Line Tools..."
    xcode-select --install
    echo "  ⚠️  بعد نصب Xcode CLT، دوباره install.sh رو اجرا کن."
    exit 0
fi
echo "  ✅ Xcode CLT already installed"

# Homebrew
if ! command -v brew &>/dev/null; then
    echo "  → Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
echo "  ✅ Homebrew installed"

# Git compression
git config --global core.compression 0

# --------------------------------------------------
# 🍺 Homebrew Bundle
# --------------------------------------------------
echo ""
echo "🍺 Step 2: Installing Homebrew packages..."
brew bundle install --file="$DOTFILES_DIR/Brewfile" --no-lock

# --------------------------------------------------
# 🐚 Shell Setup (Oh My Zsh + Powerlevel10k + Plugins)
# --------------------------------------------------
echo ""
echo "🐚 Step 3: Shell setup..."

# Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "  → Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi
echo "  ✅ Oh My Zsh installed"

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# Powerlevel10k
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
    echo "  → Installing Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
        "$ZSH_CUSTOM/themes/powerlevel10k"
fi
echo "  ✅ Powerlevel10k installed"

# zsh-autosuggestions
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    echo "  → Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions \
        "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi
echo "  ✅ zsh-autosuggestions installed"

# zsh-syntax-highlighting
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    echo "  → Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting \
        "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi
echo "  ✅ zsh-syntax-highlighting installed"

# --------------------------------------------------
# 🔗 Symlink Config Files
# --------------------------------------------------
echo ""
echo "🔗 Step 4: Symlinking config files..."

symlink() {
    local src="$1"
    local dst="$2"
    if [ -e "$dst" ] && [ ! -L "$dst" ]; then
        echo "  → Backing up existing $dst → ${dst}.backup"
        mv "$dst" "${dst}.backup"
    fi
    ln -sf "$src" "$dst"
    echo "  ✅ $dst → $src"
}

symlink "$DOTFILES_DIR/shell/.zshrc" "$HOME/.zshrc"
symlink "$DOTFILES_DIR/shell/.zprofile" "$HOME/.zprofile"
symlink "$DOTFILES_DIR/shell/.p10k.zsh" "$HOME/.p10k.zsh"
symlink "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"

# SSH config
mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"
symlink "$DOTFILES_DIR/ssh/config" "$HOME/.ssh/config"

# Hammerspoon
mkdir -p "$HOME/.hammerspoon"
symlink "$DOTFILES_DIR/hammerspoon/init.lua" "$HOME/.hammerspoon/init.lua"

# --------------------------------------------------
# ⚡ Runtime Managers
# --------------------------------------------------
echo ""
echo "⚡ Step 5: Runtime managers..."

# NVM
if [ ! -d "$HOME/.nvm" ]; then
    echo "  → Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/HEAD/install.sh | bash
fi
echo "  ✅ NVM installed"

# Load NVM and install Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
if ! nvm ls 22 &>/dev/null; then
    echo "  → Installing Node 22 via NVM..."
    nvm install 22
fi
echo "  ✅ Node 22 installed"

# Bun
if ! command -v bun &>/dev/null; then
    echo "  → Installing Bun..."
    curl -fsSL https://bun.sh/install | bash
fi
echo "  ✅ Bun installed"

# --------------------------------------------------
# 📦 Global Packages
# --------------------------------------------------
echo ""
echo "📦 Step 6: Global packages..."

# NPM globals
echo "  → Installing NPM global packages..."
npm install -g pnpm shadcn @vudovn/ag-kit

# pipx
echo "  → Installing pipx packages..."
pipx install vpn-slice 2>/dev/null || true

# yt-dlp
echo "  → Installing yt-dlp..."
python3 -m pip install -U "yt-dlp[default]" 2>/dev/null || pipx install yt-dlp 2>/dev/null || true

# --------------------------------------------------
# 🍎 macOS Defaults
# --------------------------------------------------
echo ""
echo "🍎 Step 7: Applying macOS defaults..."
bash "$DOTFILES_DIR/macos/defaults.sh"

# ============================================================
# ⚠️ MANUAL INSTALL REQUIRED
# ============================================================
echo ""
echo "=============================================="
echo "  ✅ نصب خودکار کامل شد!"
echo "=============================================="
echo ""
echo "  ⚠️  یادآوری: این اپ‌ها رو دستی نصب کن:"
echo ""
echo "  1. 🔥 Little Snitch      → https://obdev.at/littlesnitch"
echo "  2. 📸 CleanShot X        → https://cleanshot.com"
echo "  3. 📂 Transmit           → https://panic.com/transmit"
echo "  4. 💬 FluffyChat         → https://fluffychat.im"
echo "  5. 📱 Sideloadly         → https://sideloadly.io"
echo "  6. 🌐 v2rayN             → https://github.com/2dust/v2rayN"
echo "  7. ⚙️  SSH Config Editor  → App Store"
echo "  8. 🚀 Shadowrocket       → App Store (iOS only / خرید لازمه)"
echo ""
echo "=============================================="
echo "  🎉 macOS Setup Complete! Enjoy! 🎉"
echo "=============================================="

# 🖥️ Mustafa's Dotfiles

> یک کامند و همه چیز نصب میشه! 🚀

## 📦 چی شامل میشه؟

| بخش | توضیح |
|---|---|
| `Brewfile` | همه اپ‌ها، CLI tools، فونت‌ها، VS Code extensions |
| `install.sh` | اسکریپت اصلی نصب خودکار |
| `macos/defaults.sh` | تنظیمات Dock، Finder و macOS |
| `shell/` | `.zshrc`، `.zprofile`، `.p10k.zsh` |
| `git/.gitconfig` | تنظیمات Git |
| `ssh/config` | SSH hosts |
| `hammerspoon/init.lua` | Clipboard Typer |

## 🚀 نصب سریع

```bash
# 1. Clone the repo
git clone https://github.com/ChosoMeister/dotfiles.git ~/.dotfiles

# 2. Run install
cd ~/.dotfiles
bash install.sh
```

## ⚠️ نصب دستی

این اپ‌ها رو باید خودت دانلود و نصب کنی:

| # | اپ | لینک |
|---|---|---|
| 1 | 🔥 Little Snitch | https://obdev.at/littlesnitch |
| 2 | 📸 CleanShot X | https://cleanshot.com |
| 3 | 📂 Transmit | https://panic.com/transmit |
| 4 | 💬 FluffyChat | https://fluffychat.im |
| 5 | 📱 Sideloadly | https://sideloadly.io |
| 6 | 🌐 v2rayN | https://github.com/2dust/v2rayN |
| 7 | ⚙️ SSH Config Editor | App Store |
| 8 | 🚀 Shadowrocket | App Store |

## 📝 بروزرسانی

```bash
# Export current Brewfile
brew bundle dump --file=~/.dotfiles/Brewfile --force

# Commit changes
cd ~/.dotfiles
git add -A && git commit -m "update" && git push
```

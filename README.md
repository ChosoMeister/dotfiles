# 🖥️ Mustafa's Dotfiles

[![macOS](https://img.shields.io/badge/macOS-Sequoia-black?logo=apple)](https://www.apple.com/macos/)
[![Shell](https://img.shields.io/badge/Shell-Zsh-blue?logo=gnubash)](https://www.zsh.org/)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)

> یک کامند و همه چیز نصب میشه! 🚀

## 📁 ساختار

```
~/.dotfiles/
├── install.sh          # اسکریپت اصلی نصب خودکار
├── Brewfile            # اپ‌ها، CLI tools، فونت‌ها، VS Code extensions
├── .gitignore          # فایل‌های ignore شده
├── macos/
│   └── defaults.sh     # تنظیمات Dock, Finder, Keyboard, Screenshots
├── shell/
│   ├── .zshrc          # کانفیگ اصلی Zsh
│   ├── .zprofile       # PATH و env vars
│   ├── .p10k.zsh       # تم Powerlevel10k
│   ├── aliases.zsh     # 30+ میانبر
│   └── functions.zsh   # توابع کاربردی (mkcd, extract, ...)
├── git/
│   └── .gitconfig      # تنظیمات Git + aliases
├── ssh/
│   └── config          # SSH hosts
├── hammerspoon/
│   └── init.lua        # Clipboard Typer
└── README.md
```

## 🚀 نصب سریع

```bash
# 1. Clone the repo
git clone https://github.com/ChosoMeister/dotfiles.git ~/.dotfiles

# 2. Run install
cd ~/.dotfiles
bash install.sh
```

### گزینه‌های نصب

```bash
bash install.sh                # نصب کامل
bash install.sh --skip-brew    # بدون Homebrew packages
bash install.sh --skip-macos   # بدون macOS defaults
```

## 🛠️ ابزارهای مدرن CLI

| ابزار | جایگزین | کاربرد |
|--------|---------|--------|
| `eza` | `ls` | ls با آیکون و رنگ |
| `bat` | `cat` | cat با syntax highlighting |
| `ripgrep` | `grep` | grep فوق سریع |
| `fd` | `find` | find ساده‌تر |
| `fzf` | — | Fuzzy finder |
| `zoxide` | `cd` | cd هوشمند |
| `lazygit` | — | Git TUI |
| `htop` | `top` | مانیتور سیستم |

## ⚡ Aliases مفید

```bash
gs    → git status -sb
gac   → git add -A && git commit -m
gp    → git push
gl    → git log --oneline --graph
dcu   → docker compose up -d
o     → open .
ip    → public IP
mkcd  → mkdir + cd
reload → source ~/.zshrc
```

## ⚠️ نصب دستی

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

## 📄 License

MIT © [Mustafa](https://github.com/ChosoMeister)

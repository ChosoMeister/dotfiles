# 🖥️ Mustafa's Dotfiles

[![macOS](https://img.shields.io/badge/macOS-Sequoia-black?logo=apple)](https://www.apple.com/macos/)
[![Shell](https://img.shields.io/badge/Shell-Zsh-blue?logo=gnubash)](https://www.zsh.org/)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)

> یک کامند و همه چیز نصب میشه! 🚀

## 📁 ساختار

```
~/.dotfiles/
├── install.sh                  # اسکریپت اصلی نصب خودکار
├── Brewfile                    # اپ‌ها، CLI tools، فونت‌ها، VS Code extensions
├── .gitignore                  # فایل‌های ignore شده
├── macos/
│   └── defaults.sh             # تنظیمات Dock, Finder, Keyboard, Screenshots
├── shell/
│   ├── .zshrc                  # کانفیگ اصلی Zsh + Starship
│   ├── .zprofile               # PATH و env vars
│   ├── aliases.zsh             # میانبرها
│   └── functions.zsh           # توابع کاربردی (mkcd, extract, ...)
├── starship/
│   └── starship.toml           # prompt فعلی
├── yazi/                       # فایل منیجر ترمینال + theme
├── kaku/
│   └── kaku.lua                # override امن Kaku
├── opencode/
│   └── opencode.jsonc          # کانفیگ global OpenCode بدون secret
├── git/
│   └── .gitconfig              # تنظیمات Git + aliases
├── ssh/
│   └── config                  # SSH hosts
├── ghostty/
├── wezterm/
├── iterm2/
├── hammerspoon/
│   └── init.lua                # Clipboard Typer
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
| `starship` | prompt | prompt سریع و قابل حمل |
| `yazi` | file manager | فایل منیجر ترمینال |
| `git-delta` | git diff | diff خواناتر |
| `opencode` | AI coding | دستیار کدنویسی CLI |

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

> نکته: `Shadowrocket` و `SSTP Connect` به Apple ID وابسته‌اند. اگر با Apple ID دیگری خریده/نصب شده‌اند، بهتر است داخل `Brewfile` مدیریت نشوند و دستی از همان اکانت نصب/آپدیت شوند.

## 🔗 Symlinkها

`install.sh` این مسیرها را از ریپو به سیستم لینک می‌کند:

```bash
~/.zshrc
~/.zprofile
~/.gitconfig
~/.ssh/config
~/.hammerspoon/init.lua
~/.config/starship.toml
~/.config/yazi
~/.config/kaku/kaku.lua
~/.config/opencode/opencode.jsonc
~/.config/wezterm/wezterm.lua
~/Library/Application Support/com.mitchellh.ghostty/config
~/Library/Application Support/iTerm2/DynamicProfiles/mustafa-profile.json
```

## 🔒 Secret Hygiene

این فایل‌ها عمداً وارد ریپو نمی‌شوند:

```bash
~/.npmrc
~/.ssh/id_*
~/.ssh/known_hosts
~/.zsh_history
~/.cache
~/.config/kaku/state.json
~/.config/kaku/last_cwd
~/.config/opencode/node_modules
```

## 📝 بروزرسانی

```bash
# Export current Brewfile
brew bundle dump --file=~/.dotfiles/Brewfile --force

# Check current machine against Brewfile
brew bundle check --file=~/.dotfiles/Brewfile

# Commit changes
cd ~/.dotfiles
git add -A && git commit -m "update" && git push
```

## 📄 License

MIT © [Mustafa](https://github.com/ChosoMeister)

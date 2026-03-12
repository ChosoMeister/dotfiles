# ── Navigation ──
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias dev="cd $HOME/Developer"
alias dl="cd $HOME/Downloads"
alias dt="cd $HOME/Desktop"
alias dot="cd $HOME/.dotfiles"

# ── ls Improvements ──
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

# ── Git Shortcuts ──
alias gs='git status -sb'
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit -m'
alias gac='git add -A && git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gl='git log --oneline --graph --decorate -15'
alias gd='git diff'
alias gb='git branch'
alias gsw='git switch'
alias amend='git add . && git commit --amend --no-edit'
alias nuke='git clean -df && git reset --hard'

# ── Docker ──
alias dps='docker ps'
alias dcu='docker compose up -d'
alias dcd='docker compose down'
alias dcl='docker compose logs -f'

# ── Quick Edits ──
alias zshrc='${EDITOR:-code} ~/.zshrc'
alias reload='source ~/.zshrc && echo "✅ .zshrc reloaded"'

# ── Network ──
alias ip='curl -s icanhazip.com'
alias localip="ipconfig getifaddr en0"
alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder; echo "✅ DNS flushed"'

# ── macOS Specific ──
alias o='open .'
alias showfiles='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'
alias cleanup='find . -type f -name "*.DS_Store" -ls -delete'

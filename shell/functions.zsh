# ── mkcd: Create directory and cd into it ──
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# ── extract: Universal archive extractor ──
extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2) tar xjf "$1"   ;;
      *.tar.gz)  tar xzf "$1"   ;;
      *.tar.xz)  tar xJf "$1"   ;;
      *.bz2)     bunzip2 "$1"   ;;
      *.rar)     unrar x "$1"   ;;
      *.gz)      gunzip "$1"    ;;
      *.tar)     tar xf "$1"    ;;
      *.tbz2)    tar xjf "$1"   ;;
      *.tgz)     tar xzf "$1"   ;;
      *.zip)     unzip "$1"     ;;
      *.7z)      7z x "$1"      ;;
      *.Z)       uncompress "$1" ;;
      *)         echo "'$1' cannot be extracted" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# ── port: Check what process is using a port ──
port() {
  lsof -i :"$1"
}

# ── weather: Quick weather report ──
weather() {
  curl -s "wttr.in/${1:-}"
}

# ── take: Create directory tree and cd into it ──
take() {
  mkdir -p "$1" && cd "$1"
}

# ── tre: tree with sensible defaults ──
tre() {
  tree -aC -I '.git|node_modules|.DS_Store' --dirsfirst "$@" | less -FRNX
}

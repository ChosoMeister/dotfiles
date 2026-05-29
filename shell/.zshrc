# Added by Antigravity to fix Python PATH precedence
eval "$(/opt/homebrew/bin/brew shellenv)"

# Silence direnv logging and hook it
export DIRENV_LOG_FORMAT=""
eval "$(direnv hook zsh)"

# Starship prompt
eval "$(starship init zsh)"

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ── Source custom configs ──
[ -r "$HOME/.dotfiles/shell/aliases.zsh" ] && source "$HOME/.dotfiles/shell/aliases.zsh"
[ -r "$HOME/.dotfiles/shell/functions.zsh" ] && source "$HOME/.dotfiles/shell/functions.zsh"

# ── SSH wrapper (force xterm-256color for remote sessions) ──
ssh() {
  TERM=xterm-256color command ssh "$@"
}

# ── NVM ──
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Created by `pipx` on 2025-08-10 06:43:12
export PATH="$PATH:$HOME/.local/bin"
#source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
#source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# Added by Antigravity
export PATH="$HOME/.antigravity/antigravity/bin:$PATH"


# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/mustafa/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# Added by Antigravity IDE
export PATH="/Users/mustafa/.antigravity-ide/antigravity-ide/bin:$PATH"


# Added by Antigravity CLI installer
export PATH="/Users/mustafa/.local/bin:$PATH"

[[ ":$PATH:" != *":$HOME/.config/kaku/zsh/bin:"* ]] && export PATH="$HOME/.config/kaku/zsh/bin:$PATH" # Kaku PATH Integration
[[ -f "$HOME/.config/kaku/zsh/kaku.zsh" ]] && source "$HOME/.config/kaku/zsh/kaku.zsh" # Kaku Shell Integration

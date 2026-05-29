SHELL := /bin/bash

.PHONY: check
check:
	bash -n install.sh macos/defaults.sh
	zsh -n shell/.zshrc shell/.zprofile shell/aliases.zsh shell/functions.zsh
	jq empty vscode/settings.json iterm2/mustafa-profile.json
	ssh -F ssh/config -G chozo.ir >/dev/null 2>&1
	shellcheck -e SC1091 install.sh macos/defaults.sh

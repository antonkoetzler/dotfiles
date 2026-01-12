# Automatic MacOS aliases
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

# Basic aliases
alias ls='ls --color=auto'
alias ll='ls -al'
alias grep='grep --color=auto'
PS1='%F{cyan}%n %F{yellow}%~ %f$ '

## Flutter aliases
# export PATH="$PATH:$HOME/flutter/bin"
export PATH="$PATH:$HOME/.local/bin"      # Enable this while installing FVM.
export PATH="$PATH:$HOME/fvm/default/bin" # Enable this while installing FVM.
export CHROME_EXECUTABLE="/Applications/Brave Browser.app/Contents/MacOS/Brave Browser"
export PATH="$PATH":"$HOME/.pub-cache/bin"
alias flutter='fvm flutter'
alias dart='fvm dart'

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/flqn/.dart-cli-completion/zsh-config.zsh ]] && . /Users/flqn/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

# Maven
export PATH="/Applications/IntelliJ IDEA.app/Contents/plugins/maven/lib/maven3/bin:$PATH"

# adb command
export PATH=$PATH:~/Library/Android/sdk/platform-tools

# Added by Windsurf
export PATH="/Users/flqn/.codeium/windsurf/bin:$PATH"

# Enable completion system
autoload -Uz compinit
compinit

# Git completion
fpath=(~/.git-completion.zsh $fpath)

# jenv initialization
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

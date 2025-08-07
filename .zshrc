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

# JDK
# export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
# export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"

# JAVA_HOME
# export JAVA_HOME=/opt/homebrew/opt/openjdk@17
# export JAVA_HOME=/opt/homebrew/opt/openjdk@21

# Maven
export PATH="/Applications/IntelliJ IDEA.app/Contents/plugins/maven/lib/maven3/bin:$PATH"

# Prolog local API script aliases
alias run_local_prolog_api="bash $HOME/scripts/run_local_prolog_api.sh"
alias setup_local_prolog_api="bash $HOME/scripts/setup_local_prolog_api.sh"

# Helix
export PATH="$PATH:$HOME/helix-25.01.1-x86_64-macos:$PATH"
export PATH="/Library/TeX/texbin:$PATH"

# adb command
export PATH=$PATH:~/Library/Android/sdk/platform-tools

# Added by Windsurf
export PATH="/Users/flqn/.codeium/windsurf/bin:$PATH"

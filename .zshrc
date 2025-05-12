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
alias flutter='fvm flutter'

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/flqn/.dart-cli-completion/zsh-config.zsh ]] && . /Users/flqn/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

# JDK
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"

# JAVA_HOME
export JAVA_HOME=/opt/homebrew/opt/openjdk@17

# Maven
export PATH="/Applications/IntelliJ IDEA.app/Contents/plugins/maven/lib/maven3/bin:$PATH"

# Prolog local API script aliases
alias run_local_prolog_api="bash $HOME/scripts/run_local_prolog_api.sh"
alias setup_local_prolog_api="bash $HOME/scripts/setup_local_prolog_api.sh"

# PS1
PS1='%F{cyan}%n %F{yellow}%~ %f$ '

# Bun
export BUN_INSTALL="$HOME/.bun" 
export PATH="$BUN_INSTALL/bin:$PATH" 
export PATH="$HOME/.local/bin:$PATH"

# Basis aliases
alias ls='ls --color=auto'
alias ll='ls -al'
alias grep='grep --color=auto'

# OpenClaw Completion
autoload -Uz compinit && compinit 
source "/Users/flqn/.openclaw/completions/openclaw.zsh"

# FVM & Flutter
export PATH="/Users/flqn/fvm/bin:$PATH"
export PATH="/Users/flqn/fvm/default/bin:$PATH"
export CHROME_EXECUTABLE="/Applications/Brave Browser.app/Contents/MacOS/Brave Browser"

# tmux
tmux-create() { tmux new -s "$1" }
tmux-attach() { tmux attach -t "$1"; }

# adb command
export PATH=$PATH:~/Library/Android/sdk/platform-tools

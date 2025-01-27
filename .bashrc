#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -al'
alias grep='grep --color=auto'
PS1='\[\033[1;36m\]\u \[\033[1;33m\]\w \[\033[0m\]$ '

# Flutter
# export PATH="$PATH:/home/$USER/flutter/bin"   # Enable this after first installing Flutter.
export PATH="$PATH:/home/$USER/.local/bin"      # Enable this while installing FVM.
export PATH="$PATH:/home/$USER/fvm/default/bin" # Enable this while installing FVM.
export CHROME_EXECUTABLE="google-chrome-stable"

# Git completion on tab key
source /usr/share/git/completion/git-completion.bash

# Make opening applications with WSL work.
# export DISPLAY=$(ip route | awk "/default/ {print \$3}"):0

export PATH="/home/flqn/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/flqn/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

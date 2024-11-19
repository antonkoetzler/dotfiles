#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -al'
alias grep='grep --color=auto'
PS1='\[\033[1;36m\]\u \[\033[1;33m\]\w \[\033[0m\]$ '

# tmux
# https://unix.stackexchange.com/questions/43601/how-can-i-set-my-default-shell-to-start-up-tmux
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# Flutter
# export PATH="$PATH:/home/$USER/flutter/bin"
# export PATH="$PATH:/home/$USER/.fvm_flutter/bin"
export PATH="$PATH:/home/$USER/fvm/default/bin"
export CHROME_EXECUTABLE="chromium"
alias run_hub="flutter run --dart-define-from-file=envs/.env"

# Git completion on tab key
source /usr/share/git/completion/git-completion.bash

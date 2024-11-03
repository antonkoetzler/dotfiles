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
export PATH="$PATH:/home/$USER/flutter/bin"
# export PATH="$PATH:/home/$USER/.fvm_flutter/bin"
# export PATH="$PATH:/home/$USER/fvm/default/bin"
export CHROME_EXECUTABLE="chromium"
alias run_hub="flutter run --dart-define-from-file=envs/.env"

source /usr/share/git/completion/git-completion.bash

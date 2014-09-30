#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias tmux='TERM=xterm-256color tmux'
alias vim='vim --servername vim'
alias vi='vim'
export GOROOT="$HOME/apps/go"
export GOPATH="$HOME/gopath"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/apps/rust/lib"
PATH="$PATH:$HOME/apps/bin:$HOME/apps/go/bin:$GOPATH/bin:$HOME/apps/rust/bin"

export PS1='\[\033[0;33m\]\w\[\033[0m\] \$ '

# Always work in a tmux session if tmux is installed
# if which tmux 2>&1 >/dev/null; then
#   if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
#     tmux attach -t main || tmux new -s main; exit
#   fi
# fi

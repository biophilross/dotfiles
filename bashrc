# This is the personal $HOME/.bashrc file for Phil Ross

# Load .bashrc if it exists
test -f etc/bashrc && source etc/bashrc  
 
# Terminal Prompt Customization
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
#export GREP_OPTIONS='--color=always'

# set prompt
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;35m\]\w\[\033[00m\]\n\$ '

## Aliases

# remote access
alias lab='ssh -X philross@10.102.54.11'
alias biostar='ssh -X pzr3@biostar.psu.edu'
alias lionxv='ssh -X pzr3@lionxv.rcc.psu.edu'
alias hammer='ssh -X pzr3@hammer.rcc.psu.edu'

# open sftp connection
alias getfiles='sftp pzr3@biostar.psu.edu'

# Commands the way I want them
alias ll='ls -lh'
alias awk="awk -F '\t' -v OFS='\t'"
# alias bioawk="bioawk -F '\t' -v OFS='\t'"

# Interactive file commands
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Profile editing shortcuts
alias bashprof='vim ~/.bash_profile'
alias bashrc='vim ~/.bashrc'
alias vimrc='vim ~/.vimrc'
alias tmuxconf='vim ~/.tmux.conf'

# File navigation shortcuts
alias b='cd -'
alias h='cd ~'
alias s='cd /'
alias ..='cd ..'
alias ...='cd ../..'
alias date='date +%F'

# tmux stuff
alias tmux="TERM=screen-256color-bce tmux"

# Commands run when I open a new terminal session
date
echo 'Welcome, Phil!'

# Helpful Functions
 syspip(){
      PIP_REQUIRE_VIRTUALENV="" pip "$@"
 }

calc () { python -c "from math import *; print $1"; }

# Change the TERM environment variable (to get 256 colors) and make Vim
# connecting to X Server even if running in a terminal emulator (to get
# dynamic update of syntax highlight and Object Browser):
#if [ "x$DISPLAY" != "x" ]
#then
#  if [ "screen" = "$TERM" ]
#  then
#    export TERM=screen-256color
#  else
#    export TERM=xterm-256color
#  fi
#  alias vim='vim --servername VIM'
#  if [ "x$TERM" == "xxterm" ] || [ "x$TERM" == "xxterm-256color" ]
#  then
#    function tvim(){ tmux -2 new-session "TERM=screen-256color vim --servername VIM $@" ; }
#  else
#    function tvim(){ tmux new-session "vim --servername VIM $@" ; }
#  fi
#else
#  if [ "x$TERM" == "xxterm" ] || [ "x$TERM" == "xxterm-256color" ]
#  then
#    function tvim(){ tmux -2 new-session "TERM=screen-256color vim $@" ; }
#  else
#    function tvim(){ tmux new-session "vim $@" ; }
#  fi
#fi

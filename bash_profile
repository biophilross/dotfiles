#Personal $HOME/.bash_profile FILE of Phil Ross

# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# Where to look for the module 
VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python   
# Telles virtualenvwrapper where to store the virtualenvs
export WORKON_HOME=$HOME/.virtualenvs
# Runs the shell script to set up the virtualenvwrapper commands
source /usr/local/bin/virtualenvwrapper.sh
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true

# set prompt
export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ '

# Ensure user-installed binaries take precedence   
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin   

# Load RVM into a shell session as a function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

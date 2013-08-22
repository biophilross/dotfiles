#Personal $HOME/.bash_profile FILE of Phil Ross

# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

# Set architecture flags
export ARCHFLAGS="-arch x86_64"
# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# Telles virtualenvwrapper where to store the virtualenvs
export WORKON_HOME=$HOME/.virtualenvs
# Runs the shell script to set up the virtualenvwrapper commands
source /usr/local/bin/virtualenvwrapper.sh
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true

PS1="\[\033[1;32m\]\h\[\033[m\] \[\033[1;35m\]\w\[\033[m\] % "  # set prompt

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting 

export PATH="/Applications/MAMP/bin:/Applications/MAMP/Library/bin:$(find /Applications/MAMP/bin/php -type d -name "php5.4*" | sort | tail -1)/bin:$PATH"

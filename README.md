dotfiles
========

## This needs to be changed... will get to that soonish.

This it the repository for my personal dotfiles. Just follow the instructions to set up your dotfiles on a *nix system.

## Installation Steps

  1. Install git (if it's not already installed):
    1. If using OSX: 
      * Install homebrew `ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"`
      * Run `brew doctor` to make sure everything is in order
      * Run `brew install git`
    2. If using Linux:
      * Run `yum install git-core` or
      * Run `apt-get install git` depending on your distribution

  2. Clone the dotfiles repo `git clone git://github.com/thephilross/dotfiles ~/dotfiles`
  3. Clone vundle repo into dotfiles repo `git clone https://github.com/gmarik/vundle.git ~/dotfiles/vim/bundle/vundle`
  4. Switch to dotfiles directory `cd ~/dotfiles`
  5. Change execution privileges`chmod +x makesymlinks.sh`
  6. Execute script `./makesymlinks.sh`

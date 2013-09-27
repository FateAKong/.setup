#!/bin/bash

# Simple setup.sh for configuring Ubuntu EC2 instance for headless setup. 

# Install git
sudo apt-get install -y git

# Install nvm: node-version manager
# https://github.com/creationix/nvm
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest stable node
source $HOME/.nvm/nvm.sh
nvm install stable

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# git pull and install dotfiles as well
cd $HOME
if [ -d ./.dotfiles/ ]; then
    mv .dotfiles .dotfiles.old
fi
git clone git@github.com:FateAKong/.dotfiles.git
ln -sb .dotfiles/.bash_profile .
ln -sb .dotfiles/.bashrc .
ln -sb .dotfiles/.bashrc_custom .

#!/bin/bash --login
touch ~/.bash_profile

echo "=============================================================================="
echo "Downloading RVM"
echo "=============================================================================="
curl -L https://get.rvm.io | bash -s

echo "=============================================================================="
echo "Set RVM command for access through bash shell"
echo "=============================================================================="
#grep -q -e '[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"' ~/.bash_profile || echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"' >> ~/.bash_profile

echo "=============================================================================="
echo "Set bash sources, needed for ruby"
echo "=============================================================================="
#grep -q -e 'source ~/.profile' ~/.bash_profile || echo 'source ~/.profile' >> ~/.bash_profile

echo "=============================================================================="
echo "Reload bash profile"
echo "=============================================================================="
source ~/.bash_profile

echo "=============================================================================="
echo "Reload RVM"
echo "=============================================================================="
rvm reload

echo "=============================================================================="
echo "Download and install latest RVM version"
echo "=============================================================================="
rvm get stable --auto-dotfiles

echo "=============================================================================="
echo "Download and install any Ruby requirements"
echo "=============================================================================="
rvm requirements

echo "=============================================================================="
echo "Install Ruby 2.0.0"
echo "=============================================================================="
rvm install 2.0.0 --with-openssl-dir=$HOME/.rvm/usr

echo "=============================================================================="
echo "Specify which rails version to use"
echo "=============================================================================="
rvm use 2.0.0@railstutorial_rails_4_0 --create --default

echo "=============================================================================="
echo "Download and install all gems except the 'production' group"
echo "=============================================================================="
bundle install --without production

echo "=============================================================================="
echo "Creates the database to be used for Ruby on Rails"
echo "=============================================================================="
bundle exec rake db:migrate

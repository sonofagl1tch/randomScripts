#!/bin/bash
# Author Ryan Nolette
# Date Modified 06/26/2016
#This script is used to configure a fresh mac install to ready to use state
#Installing Binaries with homebrew
#Installing Apps with homebrew cask
#############################################
#start of script timestamp
start=`date +%s`
#####################Homebrew################
#install osx package management system
# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
#confirm homebrew installed correctly
brew doctor

#####################Update core unix tools################
#The next thing you should do is update the unix tools you already have on
#your mac.

# update these unix tools:
# Update homebrew recipes
brew update

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep

#You'll also need to update the $PATH in your ~/.bash_profile in order to use
#these tools over their Mac counterparts:
$PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

#This establishes a solid foundation for your Mac. You can also install other
#tools with Homebrew to improve your workflow. Here's what I install:
binaries=(
  python
  wget --with-default-names
  homebrew/dupes/grep --with-default-names
  htop
  git
  nmap
  bash-completion
  git-crypt
  ffmpeg
  colordiff
  unrar
  watch
  cask
  hh
  awscli
  coreutils
  gnu-sed --with-default-names
)
echo "installing binaries..."
brew install ${binaries[@]}

#After you're done, you should clean everything up with:
brew cleanup

############Installing Apps with Homebrew Cask#################
#Homebrew Cask is an extension for Homebrew that allows you to automate the
#installation of Mac Apps and Fonts.
#After you have homebrew installed, you'll want to install Homebrew Cask:
brew install cask

#Everyone's choice of apps will be different, but here is the script I use to install my favorite apps:
# Apps
apps=(
  appcleaner
  atom
  cyberduck
  disk-arbitrator
  flowdock
  flux
  gimp
  google-chrome
  google-drive
  google-hangouts
  iterm2
  keka
  security-growler
  spectacle
  spotify
  unetbootin
  vlc
  vmware-fusion
  vmware-horizon-client
  wireshark --with-qt
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

#If you want to install beta versions of things like Chrome Canary or
#Sublime Text 3, you'll need to tap the versions cask:
brew tap caskroom/versions

#atom packages
https://atom.io/packages/sync-settings
apm install sync-settings

#dependancies package for atom-beautify that gets installed with my sync-settings
#https://atom.io/packages/atom-beautify
pip install autopep8

#download patched font and move it to fonts folder
wget https://github.com/powerline/fonts/raw/master/Meslo/Meslo%20LG%20M%20DZ%20Regular%20for%20Powerline.otf
mv "Meslo LG M DZ Regular for Powerline.otf" ~/Library/Fonts/.

#install
#https://github.com/robbyrussell/oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#configure shell
username=`whoami`

#configure iterm2
. ./configure_iterm2.sh

#configure zshrc
. ./configure_zsh.sh


#compelted
say "Setup Mac script has Completed"
echo "#############################################"
echo "#####################Completed###############"
echo "#############################################"
#end script time
end=`date +%s`
#duration of running script
runtime="Script Duration: "$((end-start))
echo "script runtime: "$runtime

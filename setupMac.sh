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

#configure shell
username=`whoami`

#####################change location of screenshots from desktop to downloads################
defaults write com.apple.screencapture location /Users/$username/Downloads
killall SystemUIServer

#####################Update core unix tools################
#The next thing you should do is update the unix tools you already have on
#your mac.

# update these unix tools:
# Update homebrew recipes
brew update

#This establishes a solid foundation for your Mac. You can also install other
#tools with Homebrew to improve your workflow. Here's what I install:
binaries=(
  autossh
  awscli
  bash
  bash-completion
  cask
  colordiff
  coreutils
  ffmpeg
  findutils
  git
  git-crypt
  gnu-sed --with-default-names
  hh
  homebrew/dupes/grep --with-default-names
  htop
  neovim
  netcat
  nmap
  python3
  tmux
  unrar
  watch
  wget --with-default-names
  zsh-syntax-highlighting
)
echo "installing binaries..."
brew install ${binaries[@]}

#After you're done, you should clean everything up with:
brew cleanup

############Installing Apps with Homebrew Cask#################
#Homebrew Cask is an extension for Homebrew that allows you to automate the
#installation of Mac Apps and Fonts.
#After you have homebrew installed, you'll want to install Homebrew Cask:
#brew install cask

#Everyone's choice of apps will be different, but here is the script I use to install my favorite apps:
# Apps
apps=(
  appcleaner
  cyberduck
  docker
  drawio
  filezilla
  flux
  gimp
  github-desktop
  google-chrome
  iterm2
  jupyter
  jupyter-notebook-ql
  keka
  mobile-shell
  password-gorilla
  postman
  private-internet-access
  pycharm-ce
  royal-tsx
  slack
  spectacle
  spotify
  vlc
  virtualbox
  visual-studio-code
  wireshark --with-qt
)
#unused apps
#google-drive
#graphviz --with-gts
#muzzle
#security-growler
#disk-arbitrator
#pallotron-yubiswitch
#quip


# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

#After you're done, you should clean everything up with:
brew cleanup

#You'll also need to update the $PATH in your ~/.bash_profile in order to use
#these tools over their Mac counterparts:
$PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

# #download patched font and move it to fonts folder
# cd /Users/$username/Downloads
# # clone
# git clone https://github.com/powerline/fonts.git
# # install
# cd fonts
# ./install.sh
# # clean-up a bit
# cd ..
# rm -rf fonts

#install
#https://github.com/robbyrussell/oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#configure iterm2
#. ./configure_iterm2.sh
mkdir /Users/$username/Downloads/terminalSessions
#manually setup session logging


#configure zshrc
/bin/cat << EOM >  ~/.zshrc
# Path to your oh-my-zsh installation.
export ZSH=/Users/$username/.oh-my-zsh
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/$username/Library/Python/2.7/bin"
export MONO_GAC_PREFIX="/usr/local"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="agnoster"
ZSH_THEME="robbyrussell"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=2

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git aws osx ssh-agent brew docker zsh-syntax-highlighting)

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"
source \$ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#remove user@host prefix unless I am in an ssh session
[[ -n "\$SSH_CLIENT" ]] || export DEFAULT_USER="$username"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# ssh
# ssh-add ~/.ssh/id_rsa_keyName

#aliases by $username
#alias ls='ls --color=auto -lha'
export PATH="/usr/local/sbin:$PATH"

alias gua='find ~/git/ -type d -depth 2 -exec git --git-dir={}/.git --work-tree={} pull \;'
alias gitstat='find ~/git/ -type d -name '.git' | while read dir ; do sh -c "cd $dir/../ && echo -e \"\nGIT STATUS IN ${dir//\.git/}\" && git status -s" ; done'
alias python='python3'
alias wtf='dmesg'
alias onoz='cat /var/log/errors.log'
alias rtfm='man'
alias duh='du -hd1'
alias zsh-update='upgrade_oh_my_zsh'
alias grep='ggrep'
alias vim='nvim'
alias config='nvim ~/.ssh/config'
alias known='nvim ~/.ssh/known_hosts'

EOM


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

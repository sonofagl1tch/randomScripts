#!/bin/bash
# Author Ryan Nolette
# Date Modified 06/08/2020
#This script is used to configure a fresh mac install to ready to use state
#Installing Binaries with homebrew
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

#####################change location of screenshots from desktop to downloads and compress screenshot################
#move location of screenshots to downloads from desktop
defaults write com.apple.screencapture location /Users/$username/Downloads
#Achieves 90% compression just over change of format from png to jpg without visually deteriorating the quality of the capture.
# defaults write com.apple.screencapture type jpg
# killall SystemUIServer

#####################Update homebrew################
# Update homebrew recipes
brew update

#This establishes a solid foundation for your Mac. You can also install other
#tools with Homebrew to improve your workflow. Here's what I install:
binaries=(
  amazon-workdocs
  amazon-workdocs-drive
  amazon-chime
  amazon-workspaces
  appcleaner
  authy
  autossh
  awscli
  balenaetcher
  bash-completion
  burp-suite
  colordiff
  cyberduck
  disk-inventory-x
  homebrew/cask/docker
  docker-compose
  drawio
  gimp
  git
  graphviz
  homebrew/cask-fonts/font-hack-nerd-font
  hping
  htop
  iterm2
  keka
  keybase
  little-snitch
  maccy
  mobile-shell
  mosh
  neovim
  netcat
  nikto
  nmap
  pigz
  postman
  proxychains-ng
  pycharm-ce
  quip
  rectangle
  royal-tsx
  session-manager-plugin
  signal
  socat
  spotify
  stats
  suspicious-package
  telnet
  tenor
  terraform
  terraform-inventory
  tmux
  tor
  tor-browser
  torsocks
  homebrew/cask/transmission
  Vsee
  visual-studio-code
  vlc
  vnc-viewer
  watch
  wget
  homebrew/cask/wireshark
  x2goclient
  xquartz
  zenmap
  zoom
  zsh-syntax-highlighting
)
echo "installing binaries..."
brew install ${binaries[@]}

#After you're done, you should clean everything up with:
brew cleanup

#install zsh
#https://github.com/robbyrussell/oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# #install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /Users/master/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
# #install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions /Users/master/.oh-my-zsh/custom/plugins/zsh-autosuggestions

#configure zshrc
/bin/cat << EOM >  /Users/master/.zshrc
export ZSH="/Users/$username/.oh-my-zsh"
ZSH_THEME="robbyrussell"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git aws osx ssh-agent brew docker zsh-autosuggestions zsh-syntax-highlighting)
zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities github_sonofagl1tch
source $ZSH/oh-my-zsh.sh
source /Users/$username/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source /Users/$username/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
alias gua='find "/Users/$username/Google Drive/git" -type d -depth 2 -exec git --git-dir={}/.git --work-tree={} pull \;'
alias gitstat='find "/Users/$username/git" -type d -name '.git' | while read dir ; do sh -c "cd $dir/../ && echo -e \"\nGIT STATUS IN ${dir//\.git}\" && git status -s" ; done'
alias wtf='dmesg'
alias onoz='cat /var/log/errors.log'
alias rtfm='man'
alias duh='du -hd1'
alias zsh-update='upgrade_oh_my_zsh'
alias vim='nvim'
alias config='nvim /Users/master/.ssh/config'
alias known='nvim /Users/master/.ssh/known_hosts'
alias creds='nvim /Users/master/.aws/credentials'
alias fixjamf='sudo jamf flushpolicyhistory && sudo jamf recon && sudo jamf policy'
alias please='sudo $(fc -ln -1)'
alias randoUser='openssl rand -base64 20 | tr -dc A-Za-z0-9 | head -c 13 ; echo '''
alias ippublic='dig +short myip.opendns.com @resolver1.opendns.com'
alias cdgit='cd /Users/$username/git'
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
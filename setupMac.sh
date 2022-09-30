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
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/$username/install)"
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
  autossh
  awscli
  bash-completion
  colordiff
  docker-compose
  git
  gnupg
  gobject-introspection
  graphviz
  helm
  hping
  htop
  kubernetes-cli
  luajit-openresty
  mosh
  neovim
  netcat
  nikto
  nmap
  pigz
  proxychains-ng
  pyenv
  ruby
  snyk/tap/snyk
  socat
  telnet
  terraform
  terraform-inventory
  tmux
  tor
  torsocks
  watch
  wget
  zsh-syntax-highlighting
)
echo "installing binaries..."
brew install --force ${binaries[@]}

# install brew casks
# removed: sound-control
caskApps=(
  alfred4
  amazon-workdocs
  amazon-workdocs-drive
  amazon-workspaces
  amazon-chime
  appcleaner
  asana
  authy
  balenaetcher
  burp-suite
  cyberduck
  discord
  disk-inventory-x
  docker
  drawio
  firefox
  font-hack-nerd-font
  gimp
  gpg-suite
  iterm2
  keka
  keybase
  little-snitch
  maccy
  maltego
  pallotron-yubiswitch
  postman
  prowritingaid
  pycharm-ce
  quip
  rectangle
  royal-tsx
  session-manager-plugin
  signal
  slack
  spotify
  stats
  suspicious-package
  temurin11
  tenor
  tor-browser
  transmission
  visual-studio-code
  vlc
  vnc-viewer
  vsee
  wireshark
  x2goclient
  xquartz
  zenmap
  zoom
)
echo "installing cask binaries..."
brew install --force ${caskApps[@]}

#After you're done, you should clean everything up with:
brew cleanup

#install zsh
#https://github.com/robbyrussell/oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/$username/tools/install.sh)"

# #install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /Users/$username/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
# #install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions /Users/$username/.oh-my-zsh/custom/plugins/zsh-autosuggestions

#configure zshrc
/bin/cat << EOM >  /Users/$username/.zshrc
export ZSH="/Users/$username/.oh-my-zsh"
ZSH_THEME="robbyrussell"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git aws macos ssh-agent brew docker zsh-autosuggestions zsh-syntax-highlighting)
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
alias config='nvim /Users/$username/.ssh/config'
alias known='nvim /Users/$username/.ssh/known_hosts'
alias creds='nvim /Users/$username/.aws/credentials'
alias fixjamf='sudo jamf flushpolicyhistory && sudo jamf recon && sudo jamf policy'
alias please='sudo $(fc -ln -1)'
alias randoUser='openssl rand -base64 20 | tr -dc A-Za-z0-9 | head -c 13 ; echo '''
alias ippublic='dig +short myip.opendns.com @resolver1.opendns.com'
alias cdgit='cd /Users/$username/git'
alias ga='git add *'
alias gm='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gs='git status'
alias gb='git branch'
alias gch='git checkout'
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

#!/bin/bash
# Author Ryan Nolette
# Date Modified 06/26/2016
#This script is used to configure a fresh mac install to ready to use state
#Installing Binaries with homebrew
#Installing Apps with homebrew cask
#############################################


#set username
username=`whoami`

/bin/cat << EOM >  ~/.zshrc
# Path to your oh-my-zsh installation.
export ZSH=/Users/$username/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git aws osx ssh-agent brew docker bash pip zsh-syntax-highlighting)

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"
source \$ZSH/oh-my-zsh.sh

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

EOM

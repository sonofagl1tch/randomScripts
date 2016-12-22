#!/bin/bash
#setup windows system
#install cygwin manually
#https://cygwin.com/setup-x86_64.exe
#include lynx and wget in the default installer
#install cygwin packages
#install apt-cyg
lynx -source rawgit.com/transcode-open/apt-cyg/master/apt-cyg > apt-cyg
install apt-cyg /bin
#install cygwin packages I want
apt-cyg install git bash-completion vim diffutils python python3 python-setuptools curl wget tar zsh bzip2 curl ca-certificates rsync rpm

#get user name for rest of script
username=$(whoami)
basepath="/cygdrive/c/Users/"
path=$basepath$username
oldpath="/home/$username"


#download application I use
wget http://downloads.sourceforge.net/project/sevenzip/7-Zip/16.04/7z1604-x64.exe
wget https://dl.google.com/drive/1.32.4066.7445/gsync.msi
wget https://dl.google.com/tag/s/dl/chrome/install/googlechromestandaloneenterprise64.msi
wget https://flowdock-resources.s3.amazonaws.com/windows/Install%20Flowdock.exe
wget https://github.com/atom/atom/releases/download/v1.12.7/AtomSetup.exe
wget https://sourceforge.net/projects/filezilla/files/FileZilla_Client/3.23.0.2/FileZilla_3.23.0.2_win64-setup.exe/download -O FileZilla_win64-setup.exe
wget https://download.gimp.org/mirror/pub/gimp/v2.8/windows/gimp-2.8.18-setup.exe
wget https://download.spotify.com/SpotifySetup.exe
wget https://sourceforge.net/projects/winscp/files/WinSCP/5.9.3/WinSCP-5.9.3-Setup.exe/download
wget https://www.wireshark.org/download/win64/all-versions/Wireshark-win64-2.2.2.exe
wget https://nmap.org/dist/nmap-7.31-setup.exe
wget https://www.winpcap.org/install/bin/WinPcap_4_1_3.exe
wget https://download.microsoft.com/download/5/B/C/5BC5DBB3-652D-4DCE-B14A-475AB85EEF6E/vcredist_x86.exe
wget https://github.com/Maximus5/ConEmu/releases/download/v16.12.06/ConEmuSetup.161206.exe
wget http://downloads.sourceforge.net/winmerge/WinMerge-2.14.0-Setup.exe
wget http://ftp.osuosl.org/pub/videolan/vlc/2.2.4/win64/vlc-2.2.4-win64.exe

#install 7zip googledrive googleChrome flowdock atom filezilla gimp spotify winscp wireshark nmap conemu winmerge vlc
cygstart cmd /c 7z1604-x64.exe /S #successful install
cygstart cmd /c msiexec /i gsync.msi /quiet #successful install
cygstart cmd /c msiexec /i googlechromestandaloneenterprise64.msi /quiet #successful install
cygstart cmd /c AtomSetup.exe --silent #successful install
cygstart cmd /c gimp-2.8.18-setup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- #successful install
cygstart cmd /c WinSCP-5.9.3-Setup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- #successful install
cygstart cmd /c Wireshark-win64-2.2.2.exe /S /quicklaunchicon=no #successful install
cygstart cmd /c ConEmuSetup.161206.exe /quiet /norestart #requires user to choose what version to install. x86 or 64bit  #successful install
cygstart cmd /c vlc-2.2.4-win64.exe /S #successful install
cygstart cmd /c WinMerge-2.14.0-Setup.exe /VERYSILENT /SP- /NORESTART #successful install
cygstart cmd /c FileZilla_win64-setup.exe /S #successful install

#failed installs
#cygstart cmd /c SpotifySetup.exe /SILENT #need to install from non admin account
#cygstart cmd /c vcredist_x86.exe #successful install
#cygstart cmd /c WinPcap_4_1_3.exe #free version doesnt have silent installer
#cygstart cmd /c nmap-7.31-setup.exe #havent figure this out yet

#install pip
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py

#add autocompletion for git
#wget  https://github.com/git/git/raw/master/contrib/completion/git-completion.bash
#source git-completion.bash

#configure cygwin to use windows home directory as default home
echo "db_home: windows" >> /etc/nsswitch.conf

#configure cygwin to use zsh as default shell
echo "db_shell: /usr/bin/zsh" >> /etc/nsswitch.conf

#install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

#change zsh theme
#sed -i -e 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"agnoster\"/g' ~/.zshrc

#add plugins
sed -i -e 's/plugins=(git)/plugins=(git git-extras nmap python pip screen zsh-navigation-tools zsh-reload history zsh-syntax-highlighting)/g' ~/.zshrc

#add zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
source ~/.zshrc

#confgure zsh
/bin/cat << EOM >>  ~/.zshrc
#remove user@host prefix unless I am in an ssh session
[[ -n "$SSH_CLIENT" ]] || export DEFAULT_USER="$username"

# added by $username
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
export HISTTIMEFORMAT="%m/%d/%y %T "     # Add timestamp
setopt APPEND_HISTORY                 # append to history, don't overwrite it
# After each command, append to the history file and reread it
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

#aliases by $username
#alias ls='ls --color=auto -lha'
export PATH=$HOME/bin:/usr/local/bin:$PATH
EOM

#cp -R /home/master /cygdrive/c/Users/.
#echo "/home/$username"
#echo "$basepath"
cp -R /home/$username $basepath

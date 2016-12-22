#Setup windows system
powershell.exe -executionpolicy unrestricted
#install chocolately
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
#install applications i want
choco install -y googlechrome 7zip googledrive flowdock atom cygwin conemu filezilla gimp git mtputty spotify vlc winscp winmerge wireshark zenmap vmware-horizon-client

#install cygwin
#include lynx in the default installer
#install cygwin packages
#install apt-cyg
#lynx -source rawgit.com/transcode-open/apt-cyg/master/apt-cyg > apt-cyg
#install apt-cyg /bin
#install everything else I want
#apt-cyg install git bash-completion vim diffutils python python3 python-setuptools pip wget tar bzip2 curl ca-certificates rsync ssh

#install pip
#python get-pip.py

#add autocompletion for git
#cd ~/bin
#curl https://github.com/git/git/raw/master/contrib/completion/git-completion.bash -OL
#source ~/bin/git-completion.bash
#cd ~

#configure cygwin to use windows home directory as default home





iex ((New-Object System.Net.WebClient).DownloadString('rawgit.com/transcode-open/apt-cyg/master/apt-cyg'))

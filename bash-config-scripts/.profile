 
#this is the file that x11 will read
PATH=/usr/local/bin:/usr/bin:/Users/james/:/bin:/usr/bin:/sbin:/usr/local/texlive/2008/bin/universal-darwin:/Users/james/perl:/usr/X11/bin:/Users/james/bin:/usr/sbin/:/usr/local/mysql/bin:
PATH=/Users/james/bash:$PATH
if [ ! -d ~/tmp ]
     then
     mkdir ~/tmp
fi
GAUSS_SCRDIR=~/tmp
#g03root=/Volumes
export PS1='\u@\h:\w\$ '
#PROMPT_COMMAND='printf "\033k\033\134"'
#export g03root 
#export GAUSS_SCRDIR
#. $g03root/g03/bsd/g03.profile
export PATH
# Your previous /Users/james/.profile file was backed up as /Users/james/.profile.macports-saved_2009-03-01_at_17:45:58
##

# MacPorts Installer addition on 2009-03-01_at_17:45:58: adding an appropriate PATH variable for use with MacPorts.
# $PATH must be in FRONT of the macports path instead of BEHIND. This is because I want /usr/bin/php to run and not /opt/local/bin/php.. as would be the case if $PATH was included last.
export PATH=$PATH:/bin:/opt/local/bin:/opt/local/sbin:
# Finished adapting your PATH environment variable for use with MacPorts.

#add path for git
export PATH=$PATH:/usr/local/git/bin:

# MacPorts Installer addition on 2009-03-01_at_17:45:58: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH=/opt/local/share/man:$MANPATH
# Finished adapting your MANPATH environment variable for use with MacPorts.

#for editing html
export WEBPATH='/Library/WebServer/Documents'
#for current project
alias jobeet='/Library/WebServer/Documents/jobeet'
alias gitrm="git status -s | grep \" D \"| awk '{print \$2}' | xargs git rm"
alias gitma="git status -s | grep \" M \"| awk '{print \$2 }' | xargs git add"
#Alias for journal date
alias jdate='date "+%A %B %d %Y"'
#Alias for tasklist date
alias tdate='date "+%A, %m/%d/%y"'
#Alias for modification date
alias mdate='date "+%m/%d/%y"'
# Alias for tasklist date status
alias sdate='date "+%a %m/%d/%y"' 
# alias for emacsclient
alias emacs='emacsclient -n $1'
svn_root=/Users/james/SVNrep/jobeet
SVN_EDITOR=/usr/bin/emacs
export SVN_EDITOR
export svn_root
export VISUAL="vim"
export PATH=/opt/subversion/bin:$PATH
#export CDPATH='.:~:/Library/WebServer/Documents'
export HISTIGNORE="&:ls:[bf]g:exit"
[[ -s "/Users/james/.rvm/scripts/rvm" ]] && source "/Users/james/.rvm/scripts/rvm"  # This loads RVM into a shell session.
# Setup for LS colors 
export CLICOLOR=true
export LSCOLORS=exfxcxdxcxegedabagacad
# java classpath
export CLASSPATH="/Users/james/src/selenium-2.22.0/:/Users/james/src/selenium-2.22.0/*:/Users/james/src/selenium-2.22.0/com/*"
export CLASSPATH=$CLASSPATH":/Users/james/src/selenium-2.22.0/org/*:/Users/james/src/selenium-2.22.0/libs/*"
# set up variable for QSTK
source ~/bash/QSTK.sh

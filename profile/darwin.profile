
################################################################################
# PATH
################################################################################
#PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:
#export PATH="~/bin:$PATH"
#export PATH=$PATH:$HOME/code/go/pack/bin
#export PATH=./bin:~/bin:/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
################################################################################

################################################################################
# VAR
################################################################################
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
export OSG_LIBRARY_PATH=/usr/local/lib/osgPlugins-3.2.0
################################################################################

################################################################################
# JAVA
################################################################################
# export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/
# export JAVA_HOME=$(/usr/libexec/java_home)
# export JAVA_HOME="$(/usr/libexec/java_home)"
export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
################################################################################

source $HOME/.ec2_profile

################################################################################
# COMPARE
################################################################################
# PEk@93eM:AN9E9ZfP:RmKnBPQg:/#xTAFwd:u6W5aEx2:MSxfcngP
# To compare files, use the  <git difftool> command. 
# To resolve conflicting changes after merging files from a branch or
# remote repository, use <git mergetool>.
#
# which compare
#export PATH=$PATH:/Applications/Araxis\ Merge.app/Contents/Utilities
#export PATH=/Applications/Araxis\ Merge.app/Contents/Utilities:$PATH
################################################################################


#LANG="pt_BR.UTF-8"
#LC_COLLATE="pt_BR.UTF-8"
#LC_CTYPE="pt_BR.UTF-8"
#LC_MESSAGES="pt_BR.UTF-8"
#LC_MONETARY="pt_BR.UTF-8"
#LC_NUMERIC="pt_BR.UTF-8"
#LC_TIME="pt_BR.UTF-8"
#LC_ALL=
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

#export HISTIGNORE="&:[ ]*:exit"
#source $HOME/code/habitatione/go/src/github.com/escribano/habitatione/install

#source /Users/ademir/code/philosophie/shell/hegel/main.sh

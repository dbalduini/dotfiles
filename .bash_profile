# ~/.bash_profile

eval "$(thefuck --alias)"

export CLICOLOR=1
#export LSCOLORS=Fxexcxdxbxegedabagacad¬

#========================
# Environment Variables
#=======================

# Projects
export KINGHOST_PORT=21018

APPS=$HOME"/Applications"
# PhantomJS
export PHANTOMJS_HOME=$APPS"/phantomjs-2.0.0-macosx"
#export PHANTOMJS_HOME=$HOME"/Projects/ibmmethod/tests/nightwatch/node_modules/phantomjs"
export PHANTOM_BIN=$PHANTOMJS_HOME/bin/phantomjs

# Define PACKAGE_DIRS for Local Meteor Packages
export PACKAGE_DIRS="$HOME/.meteor/packages"

# JVM
export SCALA_HOME="/usr/local/Cellar/scala/2.11.7"
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export GRADLE_HOME=$APPS"/gradle-2.10"

export PATH=$PATH:$APPS"/bin"

PATH=/usr/local/Cellar/vim/7.4.1724/bin:$PATH

# export env vars
export PATH=$PATH:$PHANTOMJS_HOME/bin:$GRADLE_HOME/bin

#========================


# added by Anaconda2 4.0.0 installer
export PATH="/Users/dbalduini/anaconda/bin:$PATH"


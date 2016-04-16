#========================
# Environment Variables
#=======================

# PhantomJS
export PHANTONJS_HOME="/Users/dbalduini/Applications/phantomjs-2.0.0-macosx"
export PHANTOM_BIN=$PHANTONJS_HOME/bin/phantomjs

# Define PACKAGE_DIRS for Local Meteor Packages
export PACKAGE_DIRS="$HOME/.meteor/packages"

# JVM
export SCALA_HOME="/usr/local/Cellar/scala/2.11.7"
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export GRADLE_HOME="/Users/dbalduini/Applications/gradle-2.10"

# export env vars
export PATH=$PATH:$PHANTONJS_HOME/bin:$GRADLE_HOME/bin
#========================

# added by Anaconda2 4.0.0 installer
export PATH="/Users/dbalduini/anaconda/bin:$PATH"

PATH=/usr/local/Cellar/vim/7.4.1724/bin:$PATH

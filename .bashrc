#!/bin/bash

#########################################################################
# Shell options
shopt -s cdspell
shopt -s checkjobs
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s histverify
shopt -s hostcomplete
shopt -s huponexit

#########################################################################
# Shell history 
export HISTCONTROL=erasedups:ignoredups:ignorespace
export EDITOR=vim
export HISTFILESIZE=10000 
export HISTSIZE=100

#########################################################################
# Mah aliases

alias lsl='ls -AlhG'
alias cd..='cd ..'
alias mkdirp='mkdir -p'

alias mps='ps aux'
alias mp="ps aux | grep "
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"

## a quick way to get out of current directory ##
alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Show me the size (sorted) of only the folders in this directory
alias folders="find . -maxdepth 1 -type d -print | xargs du -sk | sort -rn"

# Make colordiff a lil easier
alias cdiff='colordiff'
alias info='info --vi-keys'

alias man="vman "

#########################################################################
# Mah functions

#dirsize - finds directory sizes and lists them for the current directory
dirsize ()
{
    du -shx * .[a-zA-Z0-9_]* 2> /dev/null | \
    egrep '^ *[0-9.]*[MG]' | sort -n > /tmp/list
    egrep '^ *[0-9.]*M' /tmp/list
    egrep '^ *[0-9.]*G' /tmp/list
    rm -rf /tmp/list
}

# Extract a file
extract () {
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xjf $1        ;;
             *.tar.gz)    tar xzf $1     ;;
             *.bz2)       bunzip2 $1       ;;
             *.rar)       rar x $1     ;;
             *.gz)        gunzip $1     ;;
             *.tar)       tar xf $1        ;;
             *.tbz2)      tar xjf $1      ;;
             *.tgz)       tar xzf $1       ;;
             *.zip)       unzip $1     ;;
             *.Z)         uncompress $1  ;;
             *.7z)        7z x $1    ;;
             *)           echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

todo_print()
{ 
    cat $HOME/.todo | gawk '{printf "%d. %s\n", NR, $0}'
}

# A simple todo taker
todo ()
{
    if [ -f $HOME/.todo ] ; then 
        touch $HOME/.todo
    fi
    if [ $# == 0 ] ; then
        todo_print
    elif [ $1 == -d ] ; then
        if [[ $2 = *[[:digit:]]* ]] ; then
            RES=$(cat $HOME/.todo | gawk -v INDEX=$2 '{if (INDEX != NR) {print}}')
            echo "$RES" > $HOME/.todo
            todo_print
        else
            echo "Unable to delete '$2' is NAN"
        fi
    else
        echo "$@" >> $HOME/.todo
    fi
}

killem()
{
    PROCESS_ID=$(ps aux | grep qemu | grep -v grep | awk '{print $2}')
    echo "Process id $PROCESS_ID"
    kill -9 "$PROCESS_ID"
}

vman() {
    vim -c "SuperMan $*"

    if [ "$?" != "0" ]; then
        echo "No manual entry for $*"
    fi
}
#########################################################################
# Setup mcahine specific stuff

source ~/.bashrc_local

#########################################################################
# Mah prompt

source ~/git/bash_powerline/bash-powerline.sh

#########################################################################
# Variables
RVM_PATH=$HOME/.rvm/bin
if [[ $PATH != ?(*:)"$RVM_PATH"?(:*) ]]
then
    export PATH="$PATH:$RVM_PATH" # Add RVM to PATH for scripting
fi

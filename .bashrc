#!/bin/bash

#########################################################################
# Shell options

shopt -s cdspell
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s huponexit

#########################################################################
# Shell history 

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Expand the history size
export HISTFILESIZE=10000 
export HISTSIZE=100
shopt -s histappend

#########################################################################
# Mah aliases
alias lsl='ls -AlhG'

## get rid of command not found ##
alias cd..='cd ..'

alias mkdirp='mkdir -p'

# process
alias mps='p saux'
alias mp="ps aux | grep "
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"

## a quick way to get out of current directory ##
alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Git
alias gits='git status'
alias gitr='git reset'
alias gita='git add --all'
alias gitp='git pull'
alias gitc='git commit -m'
alias gitd='git diff'

# HG
alias hgs='hg status'
alias hgr='hg revert -all'
alias hgpl='hg pull'
alias hgps='hg push'
alias hgu='hg update'
alias hgd='hg diff'

# Show me the size (sorted) of only the folders in this directory
alias folders="find . -maxdepth 1 -type d -print | xargs du -sk | sort -rn"

# Make colordiff a lil easier
alias cdiff='colordiff'

set show-all-if-ambiguous on
set completion-ignore-case on 

#########################################################################
# Other exports 
# GREP colors
export GREP_OPTIONS='--color=auto'

#Man page colors
# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

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


# A simple note taker
note ()
{
    # if note does not exist ... make it
    if [ -f $HOME/.notes ] ; then 
            touch $HOME/.notes
    fi
    # no argumnets, print file
    if [ $# = 0 ] ; then
            cat $HOME/.notes
    elif [ $1 = -c ]; then
            > $HOME/.notes
    else
            echo "$@" >> $HOME/.notes
    fi
}
#########################################################################
# Setup mcahine specific stuff

source ~/.bashrc_local

#########################################################################
# Mah prompt
function __setprompt
{
    local LAST_COMMAND=$? # Must come first!

    # Define colors
    local LIGHTGRAY="\033[0;37m"
    local WHITE="\033[1;37m"
    local BLACK="\033[0;30m"
    local DARKGRAY="\033[1;30m"
    local RED="\033[0;31m"
    local LIGHTRED="\033[1;31m"
    local GREEN="\033[0;32m"
    local LIGHTGREEN="\033[1;32m"
    local BROWN="\033[0;33m"
    local YELLOW="\033[1;33m"
    local BLUE="\033[0;34m"
    local LIGHTBLUE="\033[1;34m"
    local MAGENTA="\033[0;35m"
    local LIGHTMAGENTA="\033[1;35m"
    local CYAN="\033[0;36m"
    local LIGHTCYAN="\033[1;36m"
    local NOCOLOR="\033[0m"

    # Show error exit code if there is one
    if [[ $LAST_COMMAND != 0 ]]; then
        PS1="\[${DARKGRAY}\](\[${LIGHTRED}\]ERROR\[${DARKGRAY}\])-(\[${RED}\]Exit Code \[${LIGHTRED}\]${LAST_COMMAND}\[${DARKGRAY}\])-(\[${RED}\]"
        if [[ $LAST_COMMAND == 1 ]]; then
            PS1+="General error"
        elif [ $LAST_COMMAND == 2 ]; then
            PS1+="Missing keyword, command, or permission problem"
        elif [ $LAST_COMMAND == 126 ]; then
            PS1+="Permission problem or command is not an executable"
        elif [ $LAST_COMMAND == 127 ]; then
            PS1+="Command not found"
        elif [ $LAST_COMMAND == 128 ]; then
            PS1+="Invalid argument to exit"
        elif [ $LAST_COMMAND == 129 ]; then
            PS1+="Fatal error signal 1"
        elif [ $LAST_COMMAND == 130 ]; then
            PS1+="Script terminated by Control-C"
        elif [ $LAST_COMMAND == 131 ]; then
            PS1+="Fatal error signal 3"
        elif [ $LAST_COMMAND == 132 ]; then
            PS1+="Fatal error signal 4"
        elif [ $LAST_COMMAND == 133 ]; then
            PS1+="Fatal error signal 5"
        elif [ $LAST_COMMAND == 134 ]; then
            PS1+="Fatal error signal 6"
        elif [ $LAST_COMMAND == 135 ]; then
            PS1+="Fatal error signal 7"
        elif [ $LAST_COMMAND == 136 ]; then
            PS1+="Fatal error signal 8"
        elif [ $LAST_COMMAND == 137 ]; then
            PS1+="Fatal error signal 9"
        elif [ $LAST_COMMAND -gt 255 ]; then
            PS1+="Exit status out of range"
        else
            PS1+="Unknown error code"
        fi
        PS1+="\[${DARKGRAY}\])\[${NOCOLOR}\]\n"
    else
        PS1=""
    fi

    # Date
    PS1+="\[${CYAN}\]\$(date +%a-%d-%b)" # Date
    PS1+="${BLUE} $(date +%H:%M:%S) " # Time

    # CPU
    PS1+="\[${MAGENTA}\]$(ps ax | wc -l | awk '{print $1}')"

    # Jobs
    PS1+=":$(ps | wc -l | awk '{print $1}') "

    # User and server
    local SSH_IP=`echo $SSH_CLIENT | awk '{ print $1 }'`
    local SSH2_IP=`echo $SSH2_CLIENT | awk '{ print $1 }'`
    if [ $SSH2_IP ] || [ $SSH_IP ] ; then
        PS1+="\[${RED}\]\u@\h"
    else
        PS1+="\[${RED}\]\u"
    fi

    # Current directory
    PS1+="\[${BROWN}\]:\w "

    # Total size of files in current directory
    PS1+="\[${GREEN}\]$(/bin/ls -lah | /usr/bin/grep -m 1 total | awk '{print $2}')\[${DARKGRAY}\]:"

    # Number of files
    PS1+="\[${GREEN}\]$(/bin/ls -A -1 | /usr/bin/wc -l | awk '{print $1}')"

    # Skip to the next line
    PS1+="\n"

    if [[ $EUID -ne 0 ]]; then
        PS1+="\[${GREEN}\]:\[${NOCOLOR}\] " # Normal user
    else
        PS1+="\[${RED}\]:\[${NOCOLOR}\] " # Root user
    fi

}
PROMPT_COMMAND='__setprompt'

export HISTCONTROL=ignoredups:ignorespace
export EDITOR=vim
export HISTFILESIZE=10000 
export HISTSIZE=100
export FCEDIT=vim

alias vim="nvim"

alias lsl='ls -AlhG'
alias cd..='cd ..'
alias mkdirp='mkdir -p'

alias mps='ps aux'
alias mp="ps aux | grep "
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"

alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

alias cdiff='colordiff'
alias info='info --vi-keys'

dirsize ()
{
    du -shx * .[a-zA-Z0-9_]* 2> /dev/null | \
    egrep '^ *[0-9.]*[MG]' | sort -n > /tmp/list
    egrep '^ *[0-9.]*M' /tmp/list
    egrep '^ *[0-9.]*G' /tmp/list
    rm -rf /tmp/list
}

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

killem()
{
    PROCESS_ID=$(ps aux | grep qemu | grep -v grep | awk '{print $2}')
    echo "Process id $PROCESS_ID"
    kill -9 "$PROCESS_ID"
}

alias zf='source ~/.zshrc'
alias zfe='vim ~/.zshrc'

if [ -f $HOME/.zshrc_local ]; then
    source $HOME/.zshrc_local
fi

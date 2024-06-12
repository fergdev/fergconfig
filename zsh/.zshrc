set -o vi
alias vim="nvim"

export HISTCONTROL=ignoredups:ignorespace
export EDITOR=nvim
export HISTFILESIZE=10000 
export HISTSIZE=100
export FCEDIT=nvim

dirsize () {
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

killem() {
    PROCESS_ID=$(ps aux | grep  $1 | grep -v grep | awk '{print $2}')
    echo "killing id $PROCESS_ID"
    echo $PROCESS_ID | xargs kill -9
}

alias zf='source ~/.zshrc'
alias zfe='vim ~/.zshrc'

if [ -f $HOME/.zshrc_local ]; then
    source $HOME/.zshrc_local
fi

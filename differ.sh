#!/bin/bash
echo "Checking for changes ... "

function compare_update(){
  echo "Testing at locations ... $1 $2"
  if [ -f "$1" ]; then
    DIFF_OUT="$(diff $1 $2)" 
    ERR_CODE=$?
    
    if [[ $ERR_CODE -ne  0 ]]; then
      echo "DIFF FAILED"
      echo "$ERR_CODE"
      echo "$DIFF_OUT"
      read -r -p "Copy changes over ... [y/n] ?" response
      echo "Response $response"
      if [ "$response" == "y" ]; then
        echo "Copying from $1 to $2"
        cp $1 $2
      fi
    else
      echo "No changes"
    fi
  else
    echo "No found at ... $1"
  fi
}

# Test Files 
BASHRC_PATH=~/.bashrc
BASHRC_GIT=.bashrc
compare_update $BASHRC_PATH $BASHRC_GIT

BASHRC_CYGWIN_PATH=~/.bashrc_cygwin
BASHRC_CYGWIN_GIT=.bashrc_cygwin
compare_update $BASHRC_CYGWIN_PATH $BASHRC_CYGWIN_PATH

BASHRC_NATIVE_PATH=~/.bashrc_native
BASHRC_NATIVE_GIT=.bashrc_native
compare_update $BASHRC_NATIVE_PATH $BASHRC_NATIVE_PATH
 
CTAGS_PATH=~/.ctags
CTAGS_GIT=.ctags
compare_update $CTAGS_PATH $CTAGS_GIT

HGRC_PATH=~/.hgrc
HGRC_GIT=.hgrc
compare_update $HGRC_PATH $HGRC_GIT

TMUX_CONF_PATH=~/.tmux.conf
TMUX_CONF_GIT=.tmux.conf
compare_update $TMUX_CONF_PATH $TMUX_CONF_GIT

VIM_PATH=~/.vimrc
VIM_GIT=.vimrc
compare_update $VIM_PATH $VIM_GIT

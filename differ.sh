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
compare_update ~/.bashrc .bashrc
compare_update ~/.bashrc_cygwin .bashrc_cygwin
compare_update ~/.bashrc_native .bashrc_native
compare_update ~/.ctags .ctags
compare_update ~/.hgrc .hgrc
compare_update ~/.tmux.conf .tmux.conf
compare_update ~/.vimrc .vimrc

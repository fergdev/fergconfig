#!/bin/bash
echo "Checking for changes ... "

function compare_update(){
  FILENAME=$1
  HOME_FILENAME="$HOME/$FILENAME"

  echo "Testing file ... $FILENAME $HOME_FILENAME"
  if [[ -f "$HOME_FILENAME" ]]; then
    DIFF_OUT="$(diff $1 $HOME_FILENAME)" 
    ERR_CODE=$?
    
    if [[ $ERR_CODE -ne  0 ]]; then
      echo "DIFF FAILED"
      echo "$ERR_CODE"
      echo "$DIFF_OUT"
      read -r -p "Copy changes over ... [y/n] ?" response
      echo "Response $response"
      if [ "$response" == "y" ]; then
        echo "Copying from $HOME_FILENAE to $HOME"
        cp $1 $2
      fi
    else
      echo -e "No changes to $FILENAME\n"
    fi
  else
    echo -e "$HOME_FILENAME not found\n"
  fi
}

compare_update .bashrc
compare_update .bashrc_cygwin
compare_update .bashrc_native
compare_update .ctags
compare_update .hgrc
compare_update .tmux.conf
compare_update .vimrc

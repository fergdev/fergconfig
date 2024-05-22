#!/bin/bash

if [[ -z $STOW_FOLDERS ]]; then
    export STOW_FOLDERS="bash,tmux"
fi

if [[ -z $DOTFILES ]]; then
    export DOTFILES=$HOME/.dotfiles
fi

echo $STOW_FOLDERS 
echo $DOTFILES 
$DOTFILES/install.sh

#!/bin/bash
echo "Changes ... "

BASH_DIFF_OUT="$(diff ~/.bashrc .bashrc)" 
BASH_ERR_CODE=$?

VIM_DIFF_OUT="$(diff ~/.vimrc .vimrc)"
VIM_ERR_CODE=$?


echo "CODES $BASH_ERR_CODE $VIM_ERR_CODE"

if [[ $BASH_ERR_CODE -ne  0 ]]; then
	echo "BASH_RC DIFF FAILED \n"
	echo "\n\n$BASH_DIFF_OUT\n\n"
fi
if [[ $VIM_ERR_CODE -ne 0 ]]; then
	echo "VIM_RC DIFF FAILED \n"
	echo "\n\n$VIM_DIFF_OUT\n\n"
fi


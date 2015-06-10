#!/bin/bash
echo "configuring"

clean_rc="true"
platform="cygwin" #osx ... linux

if [ "$clean_rc" = "true" ]; then
	echo "Whiping out old rc files..."
	
	
	mv ~/.bahsrc ~/.bashrc_bak  
	mv ~/.vimrc ~/.vimrc_bak

	rm ~/.bashrc
	rm ~/.vimrc
fi

mkdir ~/git 

if [ "$platform" = "cygwin" ]; then
	
	# Get apt-cyg
	mkdir ~/git/apt-cyg
	lynx -source rawgit.com/transcode-open/apt-cyg/master/apt-cyg > ~/git/apt-cyg
	install ~/git/apt-cyg /bin

	# Get wget
	apt-cyg install wget

	# Get git
	apt-cyg install git

	# Get vim
	apt-cyg install vim

	# Get vundle
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

cat .bashrc >> ~/.bashrc 
cat .vimrc >> ~/.vimrc

cat ~/.bashrc_local >> ~/.bashrc

source ~/.bashrc


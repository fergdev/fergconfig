#!/bin/bash
echo "configuring"

clean_rc="true"
platform="cygwin" #osx ... linux

if [ "$clean_rc" = "true" ]; 
then
	echo "Whiping out old rc files..."

	rm -rf ~/.bashrc_bak
	rm -rf ~/.vimrc_bak	

	rm -rf ~/.bashrc_bak2

	mv ~/.bashrc ~/.bashrc_bak  
	mv ~/.vimrc ~/.vimrc_bak

	#rm -rf ~/.bashrc
	#rm -rf ~/.vimrc
fi

# Add the rc's
cat .bashrc >> ~/.bashrc 
cat .vimrc >> ~/.vimrc

# Add platform rc code
if [ "$platform" = "cygwin" ]; then
	cat .bashrc_cygwin >> ~/.bashrc
else
	cat .bashrc_native >> ~/.bashrc
fi	

# Make backup for diffing 
cp ~/.bashrc ~/.bashrc_bak2

source ~/.bashrc

###############################################################
# Platform specific
mkdir ~/git 

if [ "$platform" = "cygwin" ]; 
then
	
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


#!/bin/bash
echo "configuring"

PLATFORM=osx #osx ... cygwin ... linux
CLEAN_RC=false

if [ "${CLEAN_RC}" == "true" ]; 
then
  echo "Whiping out old rc files..."

  rm -rf ~/.bashrc_bak
  rm -rf ~/.vimrc_bak	

  rm -rf ~/.bashrc_bak2

  mv ~/.bashrc ~/.bashrc_bak  
  mv ~/.vimrc ~/.vimrc_bak

  rm -rf ~/.bashrc
  rm -rf ~/.vimrc
fi

# Add the rc's
cat .bashrc >> ~/.bashrc 
cat .vimrc >> ~/.vimrc

# Add platform rc code
if [ "${PLATFORM}" == "cygwin" ]; then
  cat .bashrc_cygwin >> ~/.bashrc
else
  cat .bashrc_native >> ~/.bashrc
fi	

# Make backup for diffing 
cp ~/.bashrc ~/.bashrc_bak2

source ~/.bashrc

GIT_CO_PATH=~/git 
if ! [ -d "${GIT_CO_PATH}" ]; then
  echo "Making git checkout dir ... ${GIT_CO_PATH}"
  mkdir ${GIT_CO_PATH}
fi

###############################################################
# Platform specific

function osx_install_update(){
  FORMULA=$1
  echo "Installing formula ... ${FORMULA}"
  FORMULA_PATH=$(which ${FORMULA})
  echo ${FORMULA_PATH}
  if [ -z "${FORMULA_PATH}" ]; then
    echo "Installing ${FORMULA}"
    brew install ${FORMULA} 
  else
    echo "${FORMULA} found at ${FORMULA_PATH} ... updating "
    brew upgrade ${FORMULA}
  fi
}
function cygwin_install_update(){
  PACKAGE=$1
  echo "Installing package ${PACKAGE}"

}
if [ "${PLATFORM}" == "cygwin" ]; then
	
	# Get apt-cyg
  APT_CYG_PATH=~/git/apt-cyg
	if [ ! "${APT_CYG_PATH}" -f ]; then
    lynx -source rawgit.com/transcode-open/apt-cyg/master/apt-cyg > ~/git/apt-cyg
    install ~/git/apt-cyg /bin
  fi

	# Install my things
	apt-cyg install wget
	apt-cyg install git
	apt-cyg install vim

elif [ "${PLATFORM}" == "osx" ]; then
  BREW_PATH=$(which bew)
  if [ -n "${BREW_PATH}" ]; then
    echo "Installing brew ..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    brew update
  fi
 
  osx_install_update wget
  osx_install_update git
  osx_install_update vim
fi

###############################################################
# Get vundle

VUNDLE_PATH=~/.vim/bundle/Vundle.vim
if ! [ -d "${VUNDLE_PATH}" ] ; then
  echo "Installing vundle ..."
  git clone https://github.com/gmarik/Vundle.vim.git ${VUNDLE_PATH}
fi


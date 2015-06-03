echo("configuring!")

clean_rc = false
platform = "cygwin" #osx ... linux

if [clean_rc = true ]; then
	rm ~/.bashrc
	rm ~/.vimrc
fi


mkdir ~/git 

if ["$platform" -eq "cygwin" ]; then
	
	# Get apt-cyg
	mkdir ~/git/apt-cyg
	lynx -source rawgit.com/transcode-open/apt-cyg/master/apt-cyg > ~/git/apt-cyg
	install ~/git/apt-cyg /bin
	
	# Get git
	apt-cyg install git

	# Get vim
	apt-cyg install vim

fi




echo "\nalias ls = 'ls -al'" >> ~/.bashrc 
echo '\nset linenumbers\n' >> ~/.vimrc


source ~/.bashrc


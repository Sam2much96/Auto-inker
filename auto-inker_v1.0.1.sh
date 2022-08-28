#!/bin/bash 

#Spaces matter alot in bash script
# goals 

# *************************************************
# godot3-Dystopia-game by INhumanity_arts
# Released under MIT License
# *************************************************
# Auto-inker
# Shell script that automates vectorization within a linux environment
# To Do:
#(1) goals (1) integrate with blender, (2) Use in a test demo production (3) 2d animation automated render pipeline
# *************************************************


set -x #for debugging

echo 'Checking for Missing Depencencies'
echo 'Auto-Inking-Bash-Script v1.1 -Written by Samuel Onome Harrison'


install_potrace (){

	# Installs the potrace library
	$(sudo apt update)
	$(sudo apt install potrace)
	exit
}


install_imageMagick () { #Doesn't work, Use these Commands to Manually install ImageMagick
	
	# Installs the image magick library
	$(sudo apt-get update -y)
	#$(sudo apt install imagemagick-6.q16)
	$(sudo apt install build-essential)
	$(wget https://www.imagemagick.org/download/ImageMagick.tar.gz)
	$(mkdir /home/$(whoami)/ImageMagick && tar xzvf ImageMagick.tar.gz && cd /home/$(whoami)/ImageMagick)
	$(./configure)
	$(make)
	$(sudo apt install make)
	$(sudo make install)
	$(sudo ldconfig /usr/local/lib)
	exit
}


checking_for_dependencies (){
	# Checks for missing Dependencies
	
	echo 'Is ImageMagick Installed : ' [ $(dpkg -s Imagemagick | grep Status) ] 
	echo 'Is Potrace installed : ' [ $(dpkg -s potrace | grep Status) ]
  	
	echo $(convert --version)
	echo $(potrace --version)
  	return
	
	
	
	



}


remove_bmp_files (){ #works

	echo 'Removing .bmp file in directory'
	##<list .bmp files in directory, saved as a varible>
	bmp_files=$(ls *.bmp)
	
	

	if [ -z "$bmp_files" ] 
	then
		echo $bmp_files"\ no .bmp files in directory"
		return
	else
		#echo $bmp_files	
		rm $bmp_files 
	fi
}


get_user_input_directory (){
	#<GETS THE IMAGE INPUT DIRECTORY FROM USER. STORES IT IN A VARIABLE>
	$(read -p 'Insert Images Directory below, Press Enter to continue. >>>>>>>') #Asks for user input

	read -p 'Insert: ' image_dir #stores user input to a variable
	script_dir=$(pwd) #Get's the script current directory and saves it to a variable

	echo Image Directory: $image_dir  

	echo  Script Directory: $script_dir #prints the script directory

	# Resets the directory
	cd

	#get_user_input_directory

	#run_main_loop

	cd $image_dir

}






vectorize () { #CODE BREAKS, SYNTAX ERROR
	echo " <THE VECTORIZER'S LOGIC> "
	#  Counts the .Png files in the directory & Runs Vectorizing loop if the image count is greater than 1
	if [ $image_count -gt 1 ]   #doesnt work, rewrite as function
	then
		echo 'Started Running Auto-Inking-Bash-Script on: ',$images,' in :', $image_dir , '/Total count: ', $image_count
		for cell in $images:
		do
			echo 'converting ',$cell,  'to vectors'
			convert $cell -monochrome $cell.bmp ##converts png to .bmp using image magick tool
			potrace -b pdf $cell.bmp -o $cell.pdf ##traces .bmp image to pdf
			echo $cell, 'converted to vectors'
			#rm $cell.bmp 
			#remove_bmp_files

		done
	fi

	if [ $image_count -eq 1 ] #If the image count is 1
	then 
		echo 'Started Running Auto-Inking-Bash-Script on', $images ,'/Total count: ', $(ls *.png /$image_dir | wc -l)
		echo 'converting ',$images,  'to vectors'
		convert $images -monochrome $images.bmp ##converts png to .bmp using image magick tool
		potrace -b pdf $images.bmp -o $images.pdf ##traces .bmp image to pdf
		echo $images, 'converted to vectors'
		
		#remove_bmp_files ##Removes .bmp files
	fi

	if [ $image_count -eq 0 ] #if the image count is zero
	then	
		echo 'There is no png file in the image directory'
	
	#return
	fi
#fi
}
	




signature () {
	#<SIGNS THE CODE WITH AN ASCII FACE>
	# Signs the Code
	echo 
	   { '
	   .@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#  
	  (@@@@@@@@@@@@@@@@@@@@@@@@@&*....,*%@@@@@@@@@@@@@@@&&%(*. /&@%*       .,,*,.   
	 %@@@@@@@@@@@@@@@@@@@@@@@@@@(                             ,%@@(                 
	@@@@@@@@@@@@@@@@@@@@@@@@@@@@%                            ,/*                    
	@@@@@@@@@@@@@@@@@@@@@@@@@@@@%*                          ..                      
	@@@@@@@@@@&(/*//&@@@@@@@@@@@@&.                         .                       
	@@@%/.            *%@@@@@@@@@@@@/                                               
	     .   ..         .%@@@@@@@@@@@@&,                                            
	/****,.   .,,*/@@(.     ./&@@@@@@@@@(.                                        . 
	/**,,,...........,(@&*.        *#@@@@#.                    .                    
	//%@@@@/ ./&#,./&@&/****/**.          ,#/%/                                     
	/,,(@@@@%/,  .,/,.    .,(@,    ,**,.    .%@%,.      /&@*..            .*/(%&@@@@
	@(**(@@@@@@@#,,,...,***.               .,%@@@@@%*       .,/#&(*,..  ......,. .,*
	@(/#@@@@@@@(*..,                                     .*  ,/*&@%/.,***,.,(@/*.   
	@@@@@@@@@&/,.                                               **,..,,,,,,**/**, .(
	@@@@@@@@@@@@@@%.       .                                         ..     ,(@,  .@
	@@@@@@@@@@@@@@@@@@@@@@%*                                                     ./@
	@@@@@@@@@@@@@@@(/%@@@/.            .#@@@@@@&&&*  .&&(                        ./@
	@@@@@@@@@@@@@@@(///*//%@@/.    .(@@@@@@@@@@@@&* ,&@&(                         .@
	@@@@@@@@@@@@#/*******,,,*/&@@@(//#@@@@@@@@@@@/,,(@@&/                         .%
	@@@@@@(//******//***/&@@@@@@@@(**/(@@@@@@@@@@(/%@@@@(                         .&
	@@#*  ,****&@@@@@@@@@@@@@@@@@@@(*,/@@@@@@@@@@@@@@@@&/                   .*(, ,/*
	      ,%@@@@@@@@@@@@@@@@@@@@@@@#/(@@@@@@@@@@@@@@@@@#,         ..    .*&%#@@&@@&.
	,/%@@@@@@@@@@@@@@@@@@@@@@@@@@&,. ./@@@@@@@@@@@@@@@@(.         ,(@/,. .,*#@@@@%.,
	@@@@@@@@@@@@@@@@@@@@@@@@@@(,   #@@@@@@&**%@@@@@@@@@/.         ,//***,,*%@@@@#,*@
	@@@@@@@@@@@@@@@@@@@@@@(.    ./@@@@@@@@@@**%@@@@@@@@(.            ***(@@@@@@(,/@@
	@@@@@@@@@@@@@@@@@@&/. ,#@@#*/@@@@@@@@@@@**%@@**/*./*,             .,/@@@@@/.*#@@
	@@@@@@@@@@@@@@@@@%/(@@@@@@@%*.,%@@@@@@@@@@@%,,****,*,             /&@@@@@&,*%@@@
	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(*......,,.  .*/,                  *#@@@@%,*&@@@@
	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/.                   ,(@@@(,*@@@@@@
	 %@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*.                   ,#&/,*#@@@@@@@
	  (@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&&&&&&&&&&&&&&&@@@@@@@@@@@@@@@
	'
	return
}






}


function run_main_loop {
#<RUNS THE FUNCTION'S MAIN LOOP>

	#""
	#Main core loop
	#""
	get_user_input_directory

	#Checks if the image directory is a null variable 
	if [ -z "$image_dir" ] 
	then
		echo $image_dir"\ image_dir is NULL, please enter a valid directory"
		exit
	else 
		echo  $image_dir"\ image_dir is NOT NULL"	
		cd $image_dir  #Breaks when there are gaps in directory link. Parse image_dir as string
		echo $pwd #When it breaks, it vectorizes the files in directory home



		images=$(ls *.png) #stores all .png files in the folder to a vaiable
		image_count=$(ls *.png /$image_dir | wc -l) # stores the image count to a variable

		#signature # Signing function
		vectorize # Vectorization function #Works
		remove_bmp_files #works

	fi



}

function install_imageMagick_on_termux { 
	$(pkg install imagemagick) 
}

function install_potrace_on_termux { 
	$(pkg install potrace) 
}





###########################......MAIN_CODES.........################################

# doesn't run in docker shell environment, remove

$(read -p 'What Should i do? >>>>Press 'Enter' to continue_____options: [run_main_loop][check_dependencies] [sign], [install_potrace], [install_imageMagick]') #Asks for user input

read -p 'Action: ' action #stores user input to a variable
#Get's the users preferred action and saves it to a variable

##### Main Logic ####
case $action in
	check_dependencies )
		checking_for_dependencies;;

	run_main_loop )
		run_main_loop
		echo the .png images are in $image_dir : $images , with total count of $image_count images #prints out the png files in the image directory
		;; 
	sign )
		signature
		;;
	install_potrace )
		install_potrace;
		;;
	intall_imagemagick )
		install_imageMagick
		;;
	install_potrace_on_termux )
		install_potrace_on_termux
		;;
	install_imageMagick_on_termux )
		install_potrace_on_termux
		;;
	*)
    echo $action " is unknown. The only allowed actions are [check_dependencies], [run_main_loop], [sign], [install_potrace], [install_imageMagick] [install_imageMagick_on_termux] [install_potrace_on_termux]"
    ;;
esac
 



echo 'Finished Successfully'


set +x #For debugging
exit


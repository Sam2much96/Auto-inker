#!/bin/bash

echo 'Checking for Missing Depencencies'
echo 'Auto-Inking-Bash-Script v1.0 -Written by Samuel Onome Harrison'
echo $(convert --version)
echo $(potrace --version)

$(read -p 'Insert Images Directory below, Press Enter to continue. >>>>>>>') #Asks for user input

read -p 'Insert: ' image_dir #stores user input to a variable
script_dir=$(pwd) #Get's the script current directory and saves it to a variable

echo Image Directory: $image_dir  

echo  Script Directory: $script_dir #prints the script directory

cd $(echo $image_dir | tr -d '\r') #changes directory
 

images=$(ls *.png) #prints all .png files in the folder


echo the .png images are in $image_dir : $images #prints out the png files in the image directory

echo 'Started Running Auto-Inking-Bash-Script on',$images,'in ', $image_dir 
for cell in $images:
do
	echo 'converting ',$cell,  'to vectors'
	convert $cell -monochrome $cell.bmp ##converts png to .bmp using image magick tool
	potrace -b pdf $cell.bmp -o $cell.pdf ##traces .bmp image to pdf
	echo $cell, 'converted to vectors'
	rm $cell.bmp ##Removes .bmp files
done

echo 'Finished Successfully'
exit

#Please note: It doesn't work well with spaces in folders names
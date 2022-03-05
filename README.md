# Auto-inking-bash-script
It is an auto inking script that works with ImageMagick and Potrace 
It vectorizes .png files and converts them to pdf
Make sure ImageMagick and potrace are installed for the script to work
It recursively vectorizes all .png files in the selected folder
If it fails to run, it'll detect the failed jpeg and png files in it's home directory

[![Watch a playtest demo video](https://img.youtube.com/vi/NUYO79E72_A/hqdefault.jpg)](https://youtu.be/NUYO79E72_A)

How to Use:
(1) The script checks if ImageMagick and Potrace are involved. You can manually install them by running the following codes
       
       
    
       Install Potrace
        $sudo apt install potrace 
      
       Install Imagemagick
        $(sudo apt-get update -y)	
	    $(sudo apt install build-essential)
	    $(wget https://www.imagemagick.org/download/ImageMagick.tar.gz)
	    $(mkdir /home/$(whoami)/ImageMagick && tar xzvf ImageMagick.tar.gz && cd /home/$(whoami)/ImageMagick)
	    $(./configure)
	    $(make)
	    $(sudo apt install make)
	    $(sudo make install)
	    $(sudo ldconfig /usr/local/lib)
       
(1) Convert Images to Black and White, no transparency
(2) Open terminal and write the following commands
    
    $cd/Auto-inker
    $chmod +x auto-inker.sh  (Use only when running auto-inker for the first time)
    $./auto-inker.sh
(3) Enter the image directory and let Auto-inker do it's work

# Auto-inking-bash-script
It is an auto inking script that works with ImageMagick and Potrace 
It vectorizes .png files and converts them to pdf
Make sure ImageMagick and potrace are installed for the script to work
It recursively vectorizes all .png files in the selected folder
If it fails to run, it'll detect the failed jpeg and png files in it's home directory

[![Watch a playtest demo video](https://img.youtube.com/vi/NUYO79E72_A/hqdefault.jpg)](https://youtu.be/NUYO79E72_A)

How to Use:
(1) The script checks if ImageMagick and Potrace are involved. 
	You can check them by running the codes
		$./auto-inker.sh
		reply: $'what_should i do?'
		$check_dependencies

	You can also manually install them by running the following codes
		$./auto-inker.sh
		reply: $'what should i do?'
		$install_potrace 
			or
		$install_imagemagick

(1) Convert Images to Black and White, no transparency
(2) Run the script ./auto-inker.sh
	reply: $'what should i do?'
	$run_main_loop
    
    $cd/Auto-inker
    $chmod +x auto-inker.sh  (Use only when running auto-inker for the first time)
    $./auto-inker.sh
(3) Enter the image directory, when running main loop and let Auto-inker do it's work

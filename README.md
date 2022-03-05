# Auto-inking-bash-script
It is an auto inking script that works with ImageMagick and Potrace 
It vectorizes .png files and converts them to pdf
Make sure ImageMagick and potrace are installed for the script to work
It recursively vectorizes all .png files in the selected folder
If it fails to run, it'll detect the failed jpeg and png files in it's home directory

[![Watch a playtest demo video](https://img.youtube.com/vi/NUYO79E72_A/hqdefault.jpg)](https://youtu.be/NUYO79E72_A)

How to Use:
(1) Convert Image to Black and White, no transparency
(2) Open terminal and write the following commands
    
    $cd/Auto-inker
    $chmod +x auto-inker.sh  (Use only when running auto-inker for the first time)
    $./auto-inker.sh
(3) Enter the image directory and let Auto-inker do it's work

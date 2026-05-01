Mulleca Conky
=============

This is a skin I made for the Conky program. Conky is a monitoring applet for the Linux desktop.

This skin is customizable. You can add your own images to the skin and they will be shown randomly every time Conky is run.

Also, the background color changes with each execution.

To install the skin, uncompress this ZIP file into the Conky skins folder

$HOME/.conky

Create the folder if it doesn't exist.

Then you'll have the folder $HOME/.conky/MullecaConky

Inside this folder, there is a subfolder named 'dolls'. This subfolder must contain images with a size of 238x465 pixels and with transparent pixels.

Likewise, there is another subfolder named 'photos'. This subfolder must contain images with a 4:3 aspect ratio. For example, with sizes of 800x600 and 1024x768. It can also contain subfolders with their respective images.

I have provided some images that I have cropped and resized to fit the skin, as an example. All images are the property of their respective owners.

Feel free to add more images or replace existing ones, as you wish.

To launch the skin, run the script:

$HOME/.conky/MullecaConky/start_mullecaconky.sh

Note: Besides Conky, the ImageMagick program must be present. In Ubuntu, the command to install it is:

sudo apt install imagemagick

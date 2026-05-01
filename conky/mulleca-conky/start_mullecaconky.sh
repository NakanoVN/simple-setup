#!/bin/bash

# MullecaConky
# Skin for Conky
# Made by Alfredo Vega
# Version 1.0

# Variables

# Elements of Conky's skin
CONKYFOLDER="$HOME"/.conky/MullecaConky
PICSFOLDER="$CONKYFOLDER"/pics

# Skin graphics
BGBW="$PICSFOLDER"/bgbw.png
BG="$PICSFOLDER"/bg.png
BORDER="$PICSFOLDER"/border.png
DOLL="$PICSFOLDER"/doll.png
PHOTO="$PICSFOLDER"/photo.png
SKINBG="$PICSFOLDER"/skinbg.png

# Minimum and maximum values ​​for the tint and luminance of skin colors.

# Limits for tint (hue).
# It includes the green, blue, and purple tones of the spectrum.
H1=124
H2=283
# Luminance levels, in percentage.
L1=25
L2=40

# The dolls folder must contain images with a size
# of 238x465 pixels and with transparent pixels.
DOLLFOLDER="$CONKYFOLDER"/dolls

# The photos folder must contain images with a 4:3 aspect ratio.
# For example, with sizes of 800x600 and 1024x768
# It can also contain subfolders with their respective images.
PHOTOFOLDER="$CONKYFOLDER"/photos

# Select a doll at random from the dolls folder.
if [ -d "$DOLLFOLDER" ]; then
  DOLLBASE=`find -H "$DOLLFOLDER" -type f \( -name "*.png" \) |
    sort --random-sort | head -1`
fi

if [ ! -f "$DOLLBASE" ]; then
  echo "Image file not found. Aborting."
  exit 1
fi

# Overwrite the previous doll.
/usr/bin/cp -f "$DOLLBASE" "$DOLL"

# Select a random photo from the photos folder.
if [ -d "$PHOTOFOLDER" ]; then
  PHOTOBASE=`find -L "$PHOTOFOLDER" -type f \( -name "*.jpg" -or -name "*.jpeg" -or -name "*.png" \) |
    sort --random-sort | head -1`
fi

if [ ! -f "$PHOTOBASE" ]; then
  echo "Image file not found. Aborting."
  exit 1
fi

# Delete the previous photo.
if [ -f "$PHOTO" ]; then
  rm -f "$PHOTO"
fi

# Scale the new photo to the appropriate size to fit the skin.
# We use the convert application from the ImageMagick program.
/usr/bin/convert "$PHOTOBASE" -resize 172x129 -filter Lanczos "$PHOTO"

# The starting background image is a grayscale image.
# Choose a tint (hue) color for the background image,
# within a certain range (green - blue - purple).
H=$(( ($SRANDOM % ($H2 - $H1 + 1)) + $H1 ))

# Randomly choose a luminance level.
L=$(( ($SRANDOM % ($L2 - $L1 + 1)) + $L1 ))

# Delete the previous background file.
if [ -f "$BG" ]; then
  rm -f "$BG"
fi

# Apply the new color to the background image.
/usr/bin/convert "$BGBW" -fill "hsl($H, 50%, $L%)" -tint 80% "$BG"

# Consolidate the four images into a single background file.

/usr/bin/convert -size 440x465 xc:none \
  "$BG" -composite \
  "$BORDER" -composite \
  "$DOLL" -composite \
  "$PHOTO" -geometry +253+114 -composite \
  "$SKINBG"

# Finally, if Conky is not active in memory, we load it.
if ! /usr/bin/pgrep -x conky > /dev/null
then
  /usr/bin/conky -c "$CONKYFOLDER"/mulleca.conkyrc &
fi

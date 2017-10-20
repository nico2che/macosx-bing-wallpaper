#!/bin/bash

# macOS Bing's wallpaper
# v0.2.2

# Default language
LANGUAGE="fr-CA"

while [[ $# -gt 0 ]] ; do
    arg="$1";
    shift;
    case "$arg" in
        "-c"|"--caption" ) CAPTION=true;;
        "--force" ) FORCE=true;;
        "-n"|"--no-refresh" ) NOREFRESH=true;;
        "-l"|"--language" ) LANGUAGE="$1"; shift;;
        "--language="* ) LANGUAGE="${arg#*=}";;
        *) >&2 echo "Unknown parameter: %arg\n"; exit 1;;
    esac
done

# Bing's API URL
API="http://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=$LANGUAGE"

function parse {
	echo $JSON | grep -Eo "\"$1\":\".*?\"" | sed -e "s/\"$1\":\"\([^\"]*\)\"/\1/";
}

JSON=$(curl -s $API)
DATE=$(parse fullstartdate);

if [ ! $FORCE ] && [ -f "$DATE.wall" ]; then
	echo "Already up to date."
else
	echo "Updating..."

	URL=$(parse url);
	curl -s "http://www.bing.com$URL" -o wallpaper.jpg

	if [ $CAPTION ]; then
        CONVERT_PATH="/usr/local/bin/convert"
		if [ $(type -t $CONVERT_PATH) ]; then
			TEXT=$(parse copyright | sed -e 's/\( (©.*\)$//');
			$CONVERT_PATH -background '#0008' -fill white -gravity center -size $((${#TEXT}*10))x40 -pointsize 20 \
          			caption:"$TEXT" \
          			wallpaper.jpg +swap -geometry +130+100 -gravity southeast -composite wallpaper.jpg;
        else
        	echo "Warning: cannot add caption, you need to install imagemagick dependencies. See Homebrew and 'brew install imagemagick'";
        fi
    fi

	rm *.wall
	if [ ! $NOREFRESH ]; then
		killall Dock
	fi
	touch "$DATE.wall"
	echo "Updated!"
fi
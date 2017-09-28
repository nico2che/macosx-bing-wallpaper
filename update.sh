#!/bin/bash

LANGUAGE="fr-CA"
API="http://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=$LANGUAGE"

JSON=$(curl -s $API)
DATE=$(echo $JSON | /usr/local/bin/jq --raw-output '.images[0].fullstartdate')

if [ -f "$DATE.wall" ]; then
	echo "Already up to date."
else
	echo "Updating..."
	URL=$(echo $JSON | /usr/local/bin/jq --raw-output '.images[0].urlbase')
	curl -s "https://www.bing.com{$URL}_1920x1080.jpg" -o wallpaper.jpg
	killall Dock
	rm *.wall
	touch "$DATE.wall"
	echo "OK !"
fi

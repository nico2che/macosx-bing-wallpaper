## macOS Bing's wallpaper

Get bing's image of the day on your desktop and travel easily through the world all days

**Optionnal dependencies setup**

If you want a caption on your wallpaper to know more about it, you need the _imagemagick_ lib on your Mac.

You can install _imagemagick_ with [Homebrew](https://brew.sh/)

`brew install imagemagick`

OR you can install _imagemagick_ with [the official way](https://www.imagemagick.org/script/download.php#macosx)

**Setup script**

```
cd ~/Pictures
git clone https://github.com/nico2che/macosx-bing-wallpaper.git wallpaper
cd wallpaper
chmod +x ./update.sh
./update.sh -n
```

Or one liner:

`cd ~/Pictures && git clone https://github.com/nico2che/macosx-bing-wallpaper.git wallpaper && cd wallpaper && chmod +x ./update.sh && ./update.sh -n`

**Setup wallpaper**

`cmd + space` -> `Desktop & Screen saver` -> `+` in bottom left sidebar and select the new `~/Pictures/wallpaper` folder,
then click on the only one wallpaper

**Setup automation**

In order to change your wallpaper all days, let's write a cron job which verify all hours

`crontab -e`

where you can write

`0 * * * * cd ~/Pictures/wallpaper && ~/Pictures/wallpaper/update.sh [options]`

**Update tool**

`cd ~/Pictures/wallpaper && git pull`

Soon automatic update

### Options

```
-l --language	    Set language code (eg. en-GB, fr-FR ...)
		    This option changes the hour of new bing image, and the
		    caption language
-c --caption 	    Write description on the image
-n --no-refresh	    Do not refresh Dock (so, wallpaper) after downloaded it
--force		    Force update image, even if already updated same day
```


### TODO

- Automating update
- Caption options:
	- position
	- size
	- bg-opacity
	- text color
	- padding
- Native item on menu bar:
	- another way to see caption, and license
	- link to the bing request to know more
	- navigate to old day pictures
	- lock current picture ?..
- ...

### License

The content of this project itself is licensed under the [WTFPL](http://www.wtfpl.net/).
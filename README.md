## macOS Bing's wallpaper

Get bing's image of the day on your desktop and travel easily through the world all days

**Setup dependencies**

`brew install jq`

TODO: best script without any dependecies

**Setup script**

```
cd ~/Pictures
git clone https://github.com/nico2che/macosx-bing-wallpaper.git wallpaper
cd wallpaper
chmod +x ./update.sh
./update.sh
```

Or one liner:

`cd ~/Pictures && git clone https://github.com/nico2che/macosx-bing-wallpaper.git wallpaper && cd wallpaper && chmod +x ./update.sh && ./update.sh`

**Setup wallpaper**

`cmd + space` -> `Desktop & Screen saver` -> `+` in bottom left sidebar and select the new `~/Pictures/wallpaper` folder,
then click on the only one wallpaper

**Setup automation**

In order to change your wallpaper all days, let's write a cron job

`crontab -e`

where you can write

`0 * * * * ~/Pictures/wallpaper/update.sh`

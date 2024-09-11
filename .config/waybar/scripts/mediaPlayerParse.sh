#!/bin/sh
if [ "$(playerctl status)" = "Paused" ]; then
	statusEmoji=""
else
	statusEmoji=""
fi

case "$(playerctl metadata --format '{{playerName}}')" in
	firefox)
		playerLogo=""
		;;
	spotify)
		playerLogo=""
		;;
	*)
		playerLogo=""
		;;
esac

title=`playerctl metadata --format "$statusEmoji {{trunc(title,30)}} - {{trunc(artist,16)}} $playerLogo\n{{duration(position)}}/{{duration(mpris:length)}}"`
echo -e "${title}" 

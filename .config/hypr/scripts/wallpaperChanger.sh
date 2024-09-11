#!/bin/sh

change_wallpaper(){
	modulo=$(($1 % 3))
	case $modulo in
		1) hyprctl hyprpaper wallpaper "eDP-1, ~/wallpapers/wallpaper1.jpg" >> /dev/null
			;;                                                                                  	# Remove lockdir when the script finishes, or when it receives a signal
		2)  hyprctl hyprpaper wallpaper "eDP-1, ~/wallpapers/wallpaper2.jpg" >> /dev/null
			;;
		*)  hyprctl hyprpaper wallpaper "eDP-1, ~/wallpapers/wallpaper3.jpg" >> /dev/null
			;;
	esac           
}

handle() {
	case $1 in
		workspace*)
			change_wallpaper ${1:0-1}
			;;	  
	esac
}

socat -U - UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done

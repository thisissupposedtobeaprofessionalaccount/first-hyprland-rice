#!/bin/sh
function getStatusIcon(){
    if [ "$(playerctl status)" = "Paused" ]; then
       echo ""
    else
        echo ""
    fi
}
function getPlayerIcon(){
    case "$(playerctl metadata --format '{{playerName}}')" in
        firefox)
            echo ""
            ;;
        spotify)
            echo ""
            ;;
        brave)
            echo "󰄛"
            ;;
        *)
            echo ""
            ;;
    esac
}

while true; do
playerctl status > /dev/null 2> /dev/null 
if [ $? -eq 0 ]; then
    title=$(playerctl metadata --format "{{title}} - {{artist}} ")
    fixedText=$(playerctl metadata --format "{{duration(position)}}/{{duration(mpris:length)}}")
    # Padding the title with spaces to ensure smooth scrolling
    padded_title=$(printf "%-24s" "$title")

    # Loop through each character and print a substring of the title
    for ((i=0; i<=${#padded_title}-24; i++)); do
	    echo -ne "\n$(getStatusIcon) ${padded_title:$i:24} $(getPlayerIcon)\n${fixedText}\r"
        sleep 1
	playerctl status > /dev/null 2> /dev/null 
	if [ $? -eq 1 ]; then
		break
	fi
    done
else
	echo -e "\n"
	sleep 10
fi
done

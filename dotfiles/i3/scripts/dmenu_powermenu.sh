# define options
options="Logout\nReboot\nShutdown\nSuspend"

# pipe options into dmenu

## white powermenu
choice=$(echo -e "$options" | dmenu -p "Power Menu:" -fn 'Hack Nerd Font:pixelsize=15' -nb '#000000' -nf '#f5f5f5' -sb '#f5f5f5' -sf '#000000' ) 

## green powermenu
#choice=$(echo -e "$options" | dmenu -p "Power Menu:" -fn 'BigBlueTermPlus Nerd Font:pixelsize=11' -nb '#000000' -nf '#00ff00' -sb '#00ff00' -sf '#000000' )

# execute the action based on the selection
case "$choice" in
	Logout)
		exec i3-msg exit
		;;
	Reboot)
		doas reboot
#		exec systemctl reboot	
		;;
	Shutdown)
		doas  poweroff
#		exec systemctl poweroff
		;;
	Suspend)
		loginctl suspend
#		doas sh -c "sleep 1 && zzz"
#		exec systemctl suspend
		;;
esac

#!/usr/bin/env sh

while true; do
	xsetroot -name "$(sh -c "${HOME}/.scripts/dwmbar.sh")"
	sleep 10s
done &

xrandr --size 1920x1080 &

xset r rate 350 55 &

xset s off -dpms &

unclutter --timeout 2 --start-hidden --jitter 16 &

xinput set-prop "Synaptics TM3336-001" "libinput Tapping Enabled" 1 &

sxhkd -c "${HOME}/.config/sxhkd/rc" &

setxkbmap -layout us,ua -option grp:shifts_toggle &

if [[ -e "${HOME}/.local/share/wallpapers/default" ]];then
	feh --no-fehbg --bg-scale "${HOME}/.local/share/wallpapers/default" &
fi

exec dwm
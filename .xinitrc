# vim:syntax=sh filetype=sh
while true
do
    xsetroot -name "$(dwmbar | tr '\n' ' ')"
    sleep 30s
done &

setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl
hsetroot -center ~/.local/share/bg.jpg
#picom -c -f -r 12 -o 1 &
sleep 2m && dropbox start &
dunst &
if [ $(hostname) -eq "desktop" ]
then
    xrandr --output DP1 --set "Broadcast RGB" "Full"
fi
udiskie &
xbindkeys &
xbanish -i all &
ssh-agent startdwm

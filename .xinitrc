# vim:syntax=sh filetype=sh
while true
do
    xsetroot -name "$(dwmbar | tr '\n' ' ')"
    sleep 30s
done &

setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl
hsetroot -center ~/.local/share/bg.jpg
#picom -c -f -r 12 -o 1 &
sleep 60 && dropbox start &
dunst &
if [ $(hostname) -eq "desktop" ]
then
    xrandr --output DP1 --set "Broadcast RGB" "Full"
else
    xcape -e "Control_L=Escape" &
    [[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
    [[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
    redshift &
fi
udiskie &
xbanish -i all &
xbindkeys &
ssh-agent startdwm

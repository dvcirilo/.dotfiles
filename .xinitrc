# vim:syntax=sh filetype=sh
while true
do
    xsetroot -name "$(dwmbar | tr '\n' ' ')"
    sleep 2
done &

setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl
hsetroot -center ~/.local/share/bg.jpg
#picom -c -f -r 12 -o 1 &
dunst &
if [ $(hostname) = "desktop" ]
then
    xrandr --output DP1 --set "Broadcast RGB" "Full"
else
    xcape -e "Control_L=Escape" &
    [[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
    [[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
    xinput disable "Synaptics TM3276-022"
fi
redshift &
udiskie &
xbanish -i all &
xbindkeys &
sleep 60 && dropbox start &
ssh-agent startdwm

# vim:syntax=sh filetype=sh
while true
do
    xsetroot -name "$(dwmbar | tr '\n' ' ')"
    sleep 2
done &

setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl
if [ $(hostname) = "desktop" ]
then
    xrandr --output HDMI2 --auto --right-of DP1 --rotate right --set "Broadcast RGB" "Full" --brightness 0.8
else
    xcape -e "Control_L=Escape" &
    [[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
    [[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
    xinput disable "Synaptics TM3276-022"
fi
#picom -c -f -r 12 -o 1 &
dunst &
hsetroot -root -cover ~/.local/share/bg
redshift &
udiskie &
xbanish -i all &
xbindkeys &
sleep 60 && dropbox start &
ssh-agent startdwm

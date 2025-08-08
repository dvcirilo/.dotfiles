# vim:syntax=sh filetype=sh
while true
do
    xsetroot -name "$(dwmbar | tr '\n' ' ')"
    sleep 2
done &

setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl
if [ $(hostname) = "desktop" ]
then
    xrandr --output DisplayPort-0 --primary --output HDMI-A-0 --auto --right-of DisplayPort-0 --rotate right --set "Broadcast RGB" "Full" --brightness 0.8
else
    if ! grep -iA5 "keyboard" /proc/bus/input/devices | grep -qi "Phys=.*usb"; then
        xcape -e "Control_L=Escape" &
        [[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
    fi
    [[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
    xinput disable "Synaptics TM3276-022"
    autorandr -c
fi
#picom -c -f -r 12 -o 1 &
dunst &
hsetroot -root -cover ~/.local/share/bg
redshift &
udiskie &
xbanish -i all &
xbindkeys &
lxqt-policykit-agent &
sleep 30 && dropbox start &
ssh-agent startdwm

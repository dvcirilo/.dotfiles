# vim:syntax=sh filetype=sh
while true
do
    xsetroot -name "$(dwmbar | tr '\n' ' ')"
    sleep 2
done &

if [ $(hostname) = "desktop" ]
then
    xrandr --output DisplayPort-0 --primary --output HDMI-A-0 --auto --right-of DisplayPort-0 --rotate right --set "Broadcast RGB" "Full" --brightness 0.8
else
    # Swapcaps only if no external keyboard is connected
    [ $(grep -ci keyboard /proc/bus/input/devices) -eq 1 ] && setxkbmap -option ctrl:swapcaps

    xinput disable "Synaptics TM3276-022"
    autorandr -c --force
    # Set dpi only if no external display is connected
    if ! xrandr | grep " connected" | grep -v "eDP"; then
        echo "Xft.dpi: 120" | xrdb -merge
    fi
fi
#picom -c -f -r 12 -o 1 &
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
dunst &
hsetroot -root -cover ~/.local/share/bg
redshift &
udiskie &
xbanish -i all &
xbindkeys &
lxqt-policykit-agent &
sleep 30 && dropbox start &
ssh-agent startdwm

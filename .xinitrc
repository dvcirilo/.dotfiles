# vim:syntax=sh filetype=sh
while true
do
    xsetroot -name "$(dwmbar)"
    sleep 30s
done &

setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
xcape -e "Control_L=Escape" &
hsetroot -center ~/.local/share/bg.jpg
#picom -c -f -r 12 -o 1 &
sleep 300 && dropbox start &
xbanish -i all &
dunst &
ssh-agent startdwm

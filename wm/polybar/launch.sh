#! /bin/sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch main and secondary bar...
if [ "$(xrandr --listmonitors | grep 'Monitors: ' | cut -d ' ' -f 2)" -gt 1 ]; then
    polybar -c ~/.config/polybar/config.ini main & disown
    polybar -c ~/.config/polybar/config.ini secondary & disown
else
    # ...or laptop bar if there is only one monitor
    polybar -c ~/.config/polybar/config.ini laptop & disown
fi

# Update lockscreen wallpaper cache
betterlockscreen -u ~/.config/polybar/scripts/lockwallpaper.png &

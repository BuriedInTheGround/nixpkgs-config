#! /bin/sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch main and secondary bar
polybar -c ~/.config/polybar/config.ini main & disown
polybar -c ~/.config/polybar/config.ini secondary & disown

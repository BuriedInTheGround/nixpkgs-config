#! /bin/sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Compose hwmon path
hwmon_path="/sys/devices/platform/coretemp.0/hwmon/$(ls /sys/devices/platform/coretemp.0/hwmon/)/temp1_input"

# Launch main and secondary bar...
if [ "$(xrandr --listmonitors | grep 'Monitors: ' | cut -d ' ' -f 2)" -gt 1 ]; then
    HWMON=$hwmon_path polybar -c ~/.config/polybar/config.ini main & disown
    HWMON=$hwmon_path polybar -c ~/.config/polybar/config.ini secondary & disown
else
    # ...or laptop bar if there is only one monitor
    MONITOR=$(polybar --list-monitors | cut -d ':' -f 1) HWMON=$hwmon_path polybar -c ~/.config/polybar/config.ini laptop & disown
fi

# Update lockscreen wallpaper cache
multilockscreen -u ~/.config/polybar/scripts/lockwallpaper.png --fx dim,color --display 1 --span &

# Set the locker
xss-lock -l -- multilockscreen --lock dim --display 1 --span &

# Run auto-toggle-polybar script for hiding the bar when in fullscreen node
kill $(pgrep -f 'auto-toggle-polybar.sh')
~/.config/polybar/scripts/auto-toggle-polybar.sh &

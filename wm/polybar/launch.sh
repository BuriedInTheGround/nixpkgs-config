#! /bin/sh

# Terminate already running bar instances
polybar-msg cmd quit

# Compose hwmon path
hwmon_path="/sys/devices/platform/coretemp.0/hwmon/$(ls /sys/devices/platform/coretemp.0/hwmon/)/temp1_input"

# Launch main and secondary bar...
if [ "$(xrandr --listmonitors | rg 'Monitors: ' | cut -d ' ' -f 2)" -gt 1 ]; then
    HWMON=$hwmon_path polybar --reload secondary -c ~/.config/polybar/config.ini & disown
    sleep 0.2
    HWMON=$hwmon_path polybar --reload main -c ~/.config/polybar/config.ini & disown
else
    # ...or laptop bar if there is only one monitor
    MONITOR=$(polybar --list-monitors | cut -d ':' -f 1) HWMON=$hwmon_path polybar -c ~/.config/polybar/config.ini laptop & disown
fi

# Update lockscreen wallpaper cache
# multilockscreen -u ~/.config/polybar/scripts/lockwallpaper.png --fx dim,color --display 1 --span &

# Set the locker
xss-lock -l -- multilockscreen --lock dim --display 1 --span & disown

# Run auto-toggle-polybar script for hiding the bar when in fullscreen node
kill $(pgrep -u $UID -f 'auto-toggle-polybar.sh')
~/.config/polybar/scripts/auto-toggle-polybar.sh & disown

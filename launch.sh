#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit
# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar -r top_internal_bar &

my_external_monitor=$(xrandr --query | grep 'DP-2')
if [[ $my_external_monitor = *connected* ]]; then
    polybar -r top_external_bar &
fi

echo "Polybar launched..."

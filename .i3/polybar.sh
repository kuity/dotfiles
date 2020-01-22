#!/usr/bin/env sh

# terminate already running instances
killall -q polybar
# Wait till processes are shut down
while pgrep -x polybar >/dev/null; do sleep 1;done
# Launch polybar
polybar kuity &
# polybar kuity &

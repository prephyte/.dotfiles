#!/bin/bash
Terminate already running bar instances
polybar-msg cmd quit
polybar mybar 2>&1 | tee -a /tmp/polybar.log & disown
echo "Polybar launched..."

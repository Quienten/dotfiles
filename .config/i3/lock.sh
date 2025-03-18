#!/bin/bash
scrot /tmp/screen.png  # Take a screenshot
convert /tmp/screen.png -blur 10x10 /tmp/screen.png  # Blur it
i3lock -i /tmp/screen.png  # Use the blurred image as lockscreen
rm /tmp/screen.png  # Remove temp file

#!/usr/bin/env bash

RELOAD_KEYS="CTRL+R"
BROWSER="google-chrome"

WINDOW_ID=$(xdotool search --onlyvisible --class ${BROWSER} | head -1)
xdotool key --window $WINDOW_ID ${RELOAD_KEYS}

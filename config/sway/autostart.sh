#!/bin/sh
timeout 120 swaymsg -t subscribe -m '["window"]' | jq --unbuffered -r 'select(.change=="new" or (.change=="title" and .container.window_properties.class=="Spotify")) | "\(.container.id) \(.container.app_id // .container.window_properties.class)"' | while read -r id app; do
    case $app in
        foot) ws=11:1 ;;
        DBeaver) ws=13:3 ;;
        google-chrome) ws=21:1 ;;
        Spotify) ws=22:2 ;;
        *) continue ;;
    esac
    swaymsg "[con_id=$id] move container to workspace number $ws"
done &
sleep 1
foot &
foot &
dbeaver &
google-chrome &
/snap/bin/spotify &

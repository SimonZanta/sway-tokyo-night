#!/bin/sh
p=$(swaymsg -t get_outputs | jq 'sort_by(.rect.x) | map(.focused) | index(true) + 1')
n=$1
if [ "$n" = new ]; then
    n=$(swaymsg -t get_workspaces | jq --argjson p "$p" '[.[].num | select(. > $p * 10 + 3 and . < $p * 10 + 10) - $p * 10, 3] | max + 1')
fi
if [ "$2" = move ]; then
    swaymsg "move container to workspace number $p$n:$n"
else
    swaymsg "workspace number $p$n:$n"
fi

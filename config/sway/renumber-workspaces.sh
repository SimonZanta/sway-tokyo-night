#!/bin/sh
swaymsg -t subscribe -m '["workspace"]' | while read -r _; do
    swaymsg -t get_workspaces | jq -r 'map(select(.num < 100 and .num % 10 > 3)) | group_by(.num / 10 | floor)[] | sort_by(.num) | to_entries[] | (.value.num / 10 | floor) as $p | select(.value.num != $p * 10 + .key + 4) | "rename workspace \(.value.name) to \($p * 10 + .key + 4):\(.key + 4)"' | while read -r cmd; do
        swaymsg "$cmd"
    done
done

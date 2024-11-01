#!/bin/bash

current_top=$(tmux display-message -p "#{pane_top}")
current_left=$(tmux display-message -p "#{pane_left}")
current_right=$(tmux display-message -p "#{pane_right}")

above_pane_id=""
above_pane_bottom=-1

# Find pane above: bottom edge <= current top, overlaps horizontally, pick highest bottom
while IFS=' ' read -r pane_id pane_top pane_left pane_right pane_bottom; do
    if [[ $pane_bottom -le $current_top ]] && \
       [[ $pane_left -lt $current_right ]] && \
       [[ $pane_right -gt $current_left ]]; then
        if [[ $pane_bottom -gt $above_pane_bottom ]]; then
            above_pane_id=$pane_id
            above_pane_bottom=$pane_bottom
        fi
    fi
done < <(tmux list-panes -F "#{pane_id} #{pane_top} #{pane_left} #{pane_right} #{pane_bottom}")

if [[ -n $above_pane_id ]]; then
    echo "$above_pane_id"
else
    echo "none"
fi


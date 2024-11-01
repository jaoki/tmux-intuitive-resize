#!/bin/bash

current_top=$(tmux display-message -p "#{pane_top}")
current_left=$(tmux display-message -p "#{pane_left}")
current_right=$(tmux display-message -p "#{pane_right}")
current_bottom=$(tmux display-message -p "#{pane_bottom}")

left_pane_id=""
left_pane_right=-1

# Find pane to the left: right edge <= current left, overlaps vertically, pick highest right
while IFS=' ' read -r pane_id pane_top pane_left pane_right pane_bottom; do
    if [[ $pane_right -le $current_left ]] && \
       [[ $pane_top -lt $current_bottom ]] && \
       [[ $pane_bottom -gt $current_top ]]; then
        if [[ $pane_right -gt $left_pane_right ]]; then
            left_pane_id=$pane_id
            left_pane_right=$pane_right
        fi
    fi
done < <(tmux list-panes -F "#{pane_id} #{pane_top} #{pane_left} #{pane_right} #{pane_bottom}")

if [[ -n $left_pane_id ]]; then
    echo "$left_pane_id"
else
    echo "none"
fi

#!/bin/bash

current_top=$(tmux display-message -p "#{pane_top}")
current_left=$(tmux display-message -p "#{pane_left}")
current_right=$(tmux display-message -p "#{pane_right}")
current_bottom=$(tmux display-message -p "#{pane_bottom}")

right_pane_id=""
right_pane_left=9999

# Find pane to the right: left edge >= current right, overlaps vertically, pick lowest left
while IFS=' ' read -r pane_id pane_top pane_left pane_right pane_bottom; do
    if [[ $pane_left -ge $current_right ]] && \
       [[ $pane_top -lt $current_bottom ]] && \
       [[ $pane_bottom -gt $current_top ]]; then
        if [[ $pane_left -lt $right_pane_left ]]; then
            right_pane_id=$pane_id
            right_pane_left=$pane_left
        fi
    fi
done < <(tmux list-panes -F "#{pane_id} #{pane_top} #{pane_left} #{pane_right} #{pane_bottom}")

if [[ -n $right_pane_id ]]; then
    echo "$right_pane_id"
else
    echo "none"
fi

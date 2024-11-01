#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

left_pane_id=$($CURRENT_DIR/get_left_pane_id.sh)

if [[ -n "$left_pane_id" && "$left_pane_id" != "none" ]]; then
    # Resize left pane to push border right, making current pane grow left
    tmux resize-pane -t "$left_pane_id" -L 10
else
    # No left pane, resize current pane left
    tmux resize-pane -L 10
fi

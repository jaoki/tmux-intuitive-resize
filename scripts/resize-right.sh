#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

right_pane_id=$($CURRENT_DIR/get_right_pane_id.sh)

if [[ -n "$right_pane_id" && "$right_pane_id" != "none" ]]; then
    # Resize right pane to push border left, making current pane grow right
    tmux resize-pane -t "$right_pane_id" -R 10
else
    # No right pane, resize current pane right
    tmux resize-pane -R 10
fi

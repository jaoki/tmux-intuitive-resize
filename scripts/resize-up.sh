#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

above_pane_id=$($CURRENT_DIR/get_above_pane_id.sh)

if [[ -n "$above_pane_id" && "$above_pane_id" != "none" ]]; then
    # Resize above pane to push border down, making current pane grow up
    tmux resize-pane -t "$above_pane_id" -U 3
else
    # No above pane, resize current pane up
    tmux resize-pane -U 3
fi

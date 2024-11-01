#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# resize panes using PREFIX + H, J, K, L like vi key bindings
tmux bind-key -r H run-shell "$CURRENT_DIR/scripts/resize-left.sh"
# tmux bind-key -r L run-shell "$CURRENT_DIR/scripts/resize-right.sh"
tmux bind-key -r L resize-pane -R 10

tmux bind-key -r J resize-pane -D 3
tmux bind-key -r K run-shell "$CURRENT_DIR/scripts/resize-up.sh"


#!/usr/bin/env bash
set -euo pipefail

current_session=$(tmux display-message -p '#S')

sessions=$(tmux list-sessions -F '#S' | grep -Fxv "$current_session" || true)

if [ -z "$sessions" ]; then
    tmux display-message "No other sessions"
    exit 0
fi

selected=$(echo "$sessions" | fzf \
    --reverse \
    --header="enter: switch | ctrl-x: kill" \
    --preview='tmux list-windows -t {} -F "  #{window_index}: #{window_name} (#{pane_current_path}) [#{pane_current_command}]"' \
    --preview-label=" Windows " \
    --preview-window=right:60% \
    --bind='ctrl-x:execute-silent(tmux kill-session -t {})+reload(tmux list-sessions -F "#S" | grep -Fxv "'"$current_session"'" || true)')

if [ -n "$selected" ]; then
    tmux switch-client -t "$selected"
fi

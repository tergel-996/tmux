# Telescope-style Session Switcher Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add a fuzzy session switcher triggered by `prefix + S` that shows sessions in a floating popup with fzf and a preview pane of each session's windows.

**Architecture:** A shell script (`scripts/session-switcher.sh`) handles all logic -- listing sessions, running fzf with a preview command, and switching on selection. tmux.conf binds `prefix + S` to launch this script inside a `display-popup`.

**Tech Stack:** bash, fzf, tmux display-popup (tmux 3.2+)

---

### Task 1: Create the session switcher script

**Files:**
- Create: `scripts/session-switcher.sh`

- [ ] **Step 1: Create the script file**

```bash
#!/usr/bin/env bash

current_session=$(tmux display-message -p '#S')

sessions=$(tmux list-sessions -F '#S' | grep -v "^${current_session}$")

if [ -z "$sessions" ]; then
    tmux display-message "No other sessions"
    exit 0
fi

selected=$(echo "$sessions" | fzf \
    --reverse \
    --header="Switch session" \
    --preview='tmux list-windows -t {} -F "  #{window_index}: #{window_name} (#{pane_current_path}) [#{pane_current_command}]"' \
    --preview-label=" Windows " \
    --preview-window=right:60%)

if [ -n "$selected" ]; then
    tmux switch-client -t "$selected"
fi
```

- [ ] **Step 2: Make it executable**

Run: `chmod +x scripts/session-switcher.sh`

- [ ] **Step 3: Manual test**

Open tmux with at least 2 sessions. Run:
```bash
~/.config/tmux/scripts/session-switcher.sh
```
Expected: fzf opens with session list on the left, window preview on the right. Selecting a session switches to it. Escape exits cleanly. With only one session, shows "No other sessions" message.

- [ ] **Step 4: Commit**

```bash
git add scripts/session-switcher.sh
git commit -m "feat: add session switcher script with fzf and preview"
```

---

### Task 2: Bind prefix + S to the popup

**Files:**
- Modify: `tmux.conf:108` (replace `bind S choose-session`)

- [ ] **Step 1: Replace the keybinding**

Change line 108 from:
```
bind S choose-session
```
to:
```
bind S display-popup -E -w 80% -h 60% "~/.config/tmux/scripts/session-switcher.sh"
```

Flags:
- `-E`: close popup when the command exits
- `-w 80%`: 80% of terminal width
- `-h 60%`: 60% of terminal height

- [ ] **Step 2: Reload and test**

Run inside tmux:
```bash
tmux source-file ~/.config/tmux/tmux.conf
```
Then press `prefix + S` (Ctrl-Space, then Shift-S).

Expected: Floating popup appears centered with the fzf session picker. Type to filter, Enter to switch, Escape to cancel.

- [ ] **Step 3: Commit**

```bash
git add tmux.conf
git commit -m "feat: bind prefix+S to telescope-style session switcher popup"
```

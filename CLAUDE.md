# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Personal tmux configuration. The entire configuration lives in `tmux.conf` with plugins managed by TPM (Tmux Plugin Manager).

## Common Commands

```bash
# Reload configuration after changes
tmux source-file ~/.config/tmux/tmux.conf

# Install plugins (after adding new @plugin lines)
# Run inside tmux: prefix + I

# Update plugins
# Run inside tmux: prefix + U
```

## Architecture

- **tmux.conf**: Single configuration file containing all settings, keybindings, and plugin declarations
- **plugins/**: Git-ignored directory where TPM installs plugins (do not edit)
- **README.md**: Complete keybinding reference

## Configuration Structure (tmux.conf)

The config is organized into sections:
1. Prefix key (`C-Space`)
2. Copy mode (vi-style bindings)
3. Visual settings (status bar, colors, pane borders)
4. Options (mouse, history, escape-time)
5. Session management keybindings (UPPERCASE: C, K, R, L, N, P, S)
6. Window management keybindings (lowercase: c, k, r, l, n, m)
7. Pane management keybindings (h, v, x)
8. Plugin declarations (must end with `run '~/.tmux/plugins/tpm/tpm'`)

## Key Design Decisions

- Prefix is `Ctrl-Space` (not default `Ctrl-b`)
- Session commands use UPPERCASE, window commands use lowercase (same letter = same action)
- All splits and new windows inherit current pane's working directory
- 1-based indexing for windows and panes

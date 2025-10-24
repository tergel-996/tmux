# Tmux Configuration Shortcuts

Prefix key: `Ctrl-Space`

## Session Management (UPPERCASE keys)

| Shortcut | Description |
|----------|-------------|
| `prefix + C` | **C**reate new session |
| `prefix + K` | **K**ill current session |
| `prefix + R` | **R**ename current session |
| `prefix + L` | Switch to **L**ast session |
| `prefix + N` | **N**ext session |
| `prefix + P` | **P**revious session |
| `prefix + S` | Choose **S**ession from list |
| `prefix + d` | **D**etach from session |

## Window Management (lowercase keys)

| Shortcut | Description |
|----------|-------------|
| `prefix + c` | **c**reate new window |
| `prefix + k` | **k**ill current window |
| `prefix + r` | **r**ename current window |
| `prefix + l` | Switch to **l**ast window |
| `prefix + n` | **n**ext window (previous) |
| `prefix + m` | **m**ore window (next) |
| `prefix + <` | Move window left |
| `prefix + >` | Move window right |
| `prefix + w` | Choose **w**indow from list |
| `prefix + 0-9` | Switch to window by number |

**Pattern**: Same operation, same letter - UPPERCASE for sessions, lowercase for windows!

## Pane Management

| Shortcut | Description |
|----------|-------------|
| `prefix + h` | Split pane horizontally (current path) |
| `prefix + v` | Split pane vertically (current path) |
| `prefix + x` | Kill current pane (no confirmation) |
| `Ctrl + h/j/k/l` | Navigate between panes (vim-tmux-navigator) |
| `prefix + z` | Zoom/unzoom current pane |
| `prefix + {` | Swap pane with previous |
| `prefix + }` | Swap pane with next |
| `prefix + q` | Show pane numbers |

## Copy Mode (Neovim-style)

### Quick Access
| Shortcut | Description |
|----------|-------------|
| `prefix + e` | **Open entire scrollback buffer in nvim** (recommended!) |
| `prefix + [` | Enter tmux copy mode |
| `prefix + Escape` | Enter tmux copy mode |
| Mouse scroll | Auto-enter copy mode |

### Navigation (in copy mode)
| Shortcut | Description |
|----------|-------------|
| `h/j/k/l` | Move cursor left/down/up/right |
| `Ctrl-h/j/k/l` | Move cursor (alternative) |
| `w` | Next word |
| `b` | Previous word |
| `e` | End of word |
| `0` | Start of line |
| `^` | First non-whitespace character |
| `$` | End of line |
| `gg` | Go to top of buffer |
| `G` | Go to bottom of buffer |
| `H` | Jump to top of screen |
| `M` | Jump to middle of screen |
| `L` | Jump to bottom of screen |

### Scrolling (in copy mode)
| Shortcut | Description |
|----------|-------------|
| `Ctrl-u` | Half page up |
| `Ctrl-d` | Half page down |
| `Ctrl-b` | Page up |
| `Ctrl-f` | Page down |

### Search (in copy mode)
| Shortcut | Description |
|----------|-------------|
| `/` | Search forward |
| `?` | Search backward |
| `n` | Next search result |
| `N` | Previous search result |

### Selection & Copy (in copy mode)
| Shortcut | Description |
|----------|-------------|
| `v` | Begin selection |
| `Ctrl-v` | Rectangle selection |
| `y` | Copy selection and exit copy mode |
| `Y` | Copy selection to system clipboard |
| `q` or `Escape` | Exit copy mode |
| Mouse selection | Automatic copy with tmux-yank |

## tmux-fzf (Fuzzy Finder)

| Shortcut | Description |
|----------|-------------|
| `prefix + f` | Open tmux-fzf menu (sessions, windows, panes, commands) |

Use the fzf interface to:
- Switch sessions
- Switch windows
- Switch panes
- Execute tmux commands
- And more...

## Other Useful Commands

| Shortcut | Description |
|----------|-------------|
| `prefix + ?` | List all key bindings |
| `prefix + :` | Enter command mode |
| `prefix + I` | Install tmux plugins (TPM) |
| `prefix + U` | Update tmux plugins (TPM) |

## Configuration Features

- **Prefix**: `Ctrl-Space` (instead of default `Ctrl-b`)
- **Base index**: Windows and panes start at 1 (not 0)
- **Mouse support**: Enabled
- **Vi mode**: Copy mode uses vi keybindings
- **Auto-renumber**: Windows are renumbered when one is closed
- **History**: 10,000 lines per pane

## Plugins

- **tpm**: Tmux Plugin Manager
- **vim-tmux-navigator**: Seamless navigation between vim and tmux panes
- **tmux-themepack**: Powerline theme (gray)
- **tmux-fzf**: Fuzzy finder for tmux
- **tmux-yank**: Enhanced clipboard integration
- **tmux-resurrect**: Save/restore tmux sessions

## Reload Configuration

After editing `tmux.conf`, reload the configuration:
```bash
tmux source-file ~/.config/tmux/tmux.conf
```

Or use: `prefix + :` then type `source-file ~/.config/tmux/tmux.conf`

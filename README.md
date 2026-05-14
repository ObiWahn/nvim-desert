# nvim-desert

A Neovim colorscheme that reproduces the look of Vim's **default colorscheme** as rendered
in Alacritty with the desert terminal palette. The goal is: open the same file in Vim
(terminal, no GUI) and in Neovim with this scheme, and see the same colors.

Since all highlight values use hex colors, the scheme works identically in GUI frontends
(Neovide, nvim-qt, etc.) — no separate GUI configuration needed.

---

## Installation & Usage

**lazy.nvim:**
```lua
{ "ObiWahn/nvim-desert" }
```

**Activate:**
```lua
vim.cmd.colorscheme("nvim-desert")
```

---

## How the mapping was derived

### Starting point: Vim usage

The user runs Vim in the terminal with:

```vim
if has("gui_running")
    colorscheme desert      " GUI only
else
    colorscheme default     " terminal (the palette this scheme is based on)
endif
```

In terminal mode Vim uses `colorscheme default`, which calls `syntax reset` and loads
`/usr/share/vim/vim91/syntax/syncolor.vim`. That file assigns **cterm color names** (like
`Cyan`, `Yellow`, `LightBlue`) to each syntax group for a dark background.

### Vim's cterm color name → ANSI index mapping

Vim's named cterm colors map to standard ANSI terminal indices as follows.
These are the indices Alacritty looks up in its `[colors.normal]` / `[colors.bright]`
tables to produce the actual rendered hex color.

| Vim cterm name         | ANSI index | Palette slot   |
|------------------------|------------|----------------|
| Black                  | 0          | normal black   |
| DarkRed                | 1          | normal red     |
| DarkGreen              | 2          | normal green   |
| DarkYellow / Brown     | 3          | normal yellow  |
| DarkBlue               | 4          | normal blue    |
| DarkMagenta            | 5          | normal magenta |
| DarkCyan               | 6          | normal cyan    |
| Gray / LightGray       | 7          | normal white   |
| DarkGray               | 8          | bright black   |
| Red / LightRed         | 9          | bright red     |
| Green / LightGreen     | 10         | bright green   |
| Yellow / LightYellow / Cyan / LightCyan | 11 / 14 | bright yellow / bright cyan |
| Blue / LightBlue       | 12         | bright blue    |
| Magenta / LightMagenta | 13         | bright magenta |
| White                  | 15         | bright white   |

> **Important:** Vim's internal NR-16 numbering in `:help cterm-colors` is NOT the ANSI
> index. The table above reflects the actual escape codes Vim sends to the terminal.

### Vim default dark-background syntax assignments (vim92 baseline)

From `/usr/share/vim/vim92/syntax/syncolor.vim` (`&background == "dark"`):

| Vim group           | cterm color | ANSI# | Resolved hex (Alacritty) |
|---------------------|-------------|-------|--------------------------|
| Comment             | DarkBlue    | 4     | `#5087C8`                |
| Constant            | Red         | 1     | `#E0546A`                |
| Statement / Keyword | Yellow      | 3     | `#FCBF35`                |
| PreProc / Include   | Magenta     | 5     | `#9E00DE`                |
| Type                | Green       | 2     | `#3CC85E`                |
| Special             | Magenta     | 5     | `#9E00DE`                |
| LineNr              | DarkYellow  | 3     | `#FCBF35`                |

### draw_bold_text_with_bright_colors

Alacritty is configured with `draw_bold_text_with_bright_colors = true`. However,
vim92's `syncolor.vim` does not set `cterm=bold` on any of the core syntax groups
(only `term=bold`, which applies to monochrome terminals). So this setting does not
affect terminal syntax colors — it only matters for UI elements that explicitly use
`cterm=bold`.

### Customisations applied on top of the vim92 baseline

The colorscheme deviates from vim92 defaults to improve readability and differentiate
C++ symbol types:

| Role                           | Hex                    | Rationale                                         |
|--------------------------------|------------------------|---------------------------------------------------|
| Free functions                 | `#4DEEC7` (br_cyan)    | Stand out from regular identifiers                |
| Methods                        | `#008A8B` (cyan)       | Distinct from free functions, matches member vars |
| Member variables / fields      | `#008A8B` (cyan)       | Visual tie to methods                             |
| Operators (`<<`, `&`, `=`)     | `#FF8538` (br_yellow)  | Distinct from keywords                            |
| Keyword modifiers (`const`, `static`, `public`) | `#3CC85E` (green) | Same family as types                  |
| Builtin types (`int`, `bool`)  | `#3CC85E` (green)      | Distinct from user-defined types                  |
| User-defined types / classes   | `#fffdb3` (fg)         | No special color — foreground                     |
| Variables / parameters         | `#fffdb3` (fg)         | No special color — foreground                     |
| `#include`, `#pragma`          | `#9E00DE` (magenta)    | Matches vim92 PreProc                             |
| Bash string variables (`$VAR`) | `#B04AD9` (br_magenta) | Match the `$` sigil color                         |
| All syntax groups              | bold                   | Personal preference; inlay hints excluded         |

---

## Code architecture

Three strictly separated layers — **never skip a layer** or assign raw hex outside
`palette.lua`:

```
palette.lua       raw hex values, keyed by terminal slot name
                  (bg, fg, black, red … br_white)
      ↓
theme.lua         semantic roles mapped to palette entries via c.*
                  (comment, keyword, type, line_nr …)
                  color choices follow Vim default cterm assignments above
      ↓
highlights.lua    Neovim highlight groups mapped to roles via r.*
                  (Comment, Keyword, @function, DiagnosticError …)
                  no color values here, only role references + style flags
```

To change a color: edit `palette.lua`.
To remap a role to a different palette color: edit `theme.lua`.
To add a new Neovim highlight group: edit `highlights.lua`.

---

## Source Colors (Alacritty)

From [`alacritty.toml`](alacritty.toml) (included in this repo):

### Primary

| Role              | Hex       |
|-------------------|-----------|
| background        | `#333333` |
| foreground        | `#fffdb3` |
| bright_foreground | `#ffffff` |

### Normal (ANSI 0–7)

| Name    | Hex       |
|---------|-----------|
| black   | `#666666` |
| red     | `#E0546A` |
| green   | `#3CC85E` |
| yellow  | `#FCBF35` |
| blue    | `#5087C8` |
| magenta | `#9E00DE` |
| cyan    | `#008A8B` |
| white   | `#eaeaea` |

### Bright (ANSI 8–15)

| Name    | Hex       |
|---------|-----------|
| black   | `#5B5252` |
| red     | `#E91537` |
| green   | `#2CFF2C` |
| yellow  | `#FF8538` |
| blue    | `#525EFF` |
| magenta | `#B04AD9` |
| cyan    | `#4DEEC7` |
| white   | `#ffffff` |

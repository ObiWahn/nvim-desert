# nvim-desert

A Neovim colorscheme that reproduces the look of Vim's **default colorscheme** as rendered
in Alacritty with the desert terminal palette. The goal is: open the same file in Vim
(terminal, no GUI) and in Neovim with this scheme, and see the same colors.

---

## Installation & Usage

**lazy.nvim:**
```lua
{ "jan-christoph-uhde/nvim-desert" }
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
    colorscheme default     " terminal — this is what matters
endif
```

In terminal mode Vim uses `colorscheme default`, which calls `syntax reset` and loads
`/usr/share/vim/vim91/syntax/syncolor.vim`. That file assigns **cterm color names** (like
`Cyan`, `Yellow`, `LightBlue`) to each syntax group for a dark background.

### Vim's cterm color name → ANSI index mapping

Vim's named cterm colors map to standard ANSI terminal indices as follows.
These are the indices Alacritty looks up in its `[colors.normal]` / `[colors.bright]`
tables to produce the actual rendered hex color.

| Vim cterm name | ANSI index | Palette slot |
|----------------|-----------|--------------|
| Black          | 0         | normal black |
| DarkRed        | 1         | normal red   |
| DarkGreen      | 2         | normal green |
| DarkYellow / Brown | 3    | normal yellow |
| DarkBlue       | 4         | normal blue  |
| DarkMagenta    | 5         | normal magenta |
| DarkCyan       | 6         | normal cyan  |
| Gray / LightGray | 7       | normal white |
| DarkGray       | 8         | bright black |
| Red / LightRed | 9         | bright red   |
| Green / LightGreen | 10    | bright green |
| Yellow / LightYellow / Cyan / LightCyan | 11 / 14 | bright yellow / bright cyan |
| Blue / LightBlue | 12      | bright blue  |
| Magenta / LightMagenta | 13 | bright magenta |
| White          | 15        | bright white |

> **Important:** Vim's internal NR-16 numbering in `:help cterm-colors` is NOT the ANSI
> index. The table above reflects the actual escape codes Vim sends to the terminal.

### Vim default dark-background syntax assignments

From `/usr/share/vim/vim91/syntax/syncolor.vim` (`&background == "dark"`):

| Vim group | cterm color | ANSI# | Resolved hex (Alacritty) | palette.lua key |
|-----------|------------|-------|--------------------------|-----------------|
| Comment   | Cyan       | 14    | `#4DEEC7`                | `br_cyan`       |
| Constant  | Magenta    | 13    | `#B04AD9`                | `br_magenta`    |
| String → Constant | Magenta | 13 | `#B04AD9`             | `br_magenta`    |
| Number → Constant | Magenta | 13 | `#B04AD9`             | `br_magenta`    |
| Boolean → Constant | Magenta | 13 | `#B04AD9`            | `br_magenta`    |
| Identifier | Cyan + bold | 14  | `#4DEEC7` **bold**       | `br_cyan`       |
| Function → Identifier | Cyan + bold | 14 | `#4DEEC7` **bold** | `br_cyan`   |
| Statement | Yellow     | 11    | `#FF8538`                | `br_yellow`     |
| Keyword → Statement | Yellow | 11 | `#FF8538`             | `br_yellow`     |
| Operator → Statement | Yellow | 11 | `#FF8538`            | `br_yellow`     |
| Exception → Statement | Yellow | 11 | `#FF8538`           | `br_yellow`     |
| PreProc   | LightBlue  | 12    | `#525EFF`                | `br_blue`       |
| Include → PreProc | LightBlue | 12 | `#525EFF`            | `br_blue`       |
| Macro → PreProc | LightBlue | 12 | `#525EFF`              | `br_blue`       |
| Type      | LightGreen | 10    | `#2CFF2C`                | `br_green`      |
| StorageClass → Type | LightGreen | 10 | `#2CFF2C`          | `br_green`      |
| Structure → Type | LightGreen | 10 | `#2CFF2C`             | `br_green`      |
| Special   | LightRed   | 9     | `#E91537`                | `br_red`        |
| Tag → Special | LightRed | 9    | `#E91537`                | `br_red`        |
| Delimiter → Special | LightRed | 9 | `#E91537`             | `br_red`        |
| SpecialChar → Special | LightRed | 9 | `#E91537`           | `br_red`        |
| Error     | White on Red | 15/9 | `#ffffff` on `#E91537` | `br_white`/`br_red` |
| Todo      | Black on Yellow | 0/11 | `#666666` on `#FF8538` | `black`/`br_yellow` |
| LineNr    | DarkYellow | 3     | `#FCBF35`                | `yellow`        |
| CursorLineNr | DarkYellow bold | 3 | `#FCBF35` **bold**  | `yellow`        |

### draw_bold_text_with_bright_colors

Alacritty is configured with `draw_bold_text_with_bright_colors = true`. This means: when
Vim sends a **normal** color (0–7) with `cterm=bold`, Alacritty renders it as the
corresponding **bright** color (8–15). In the table above, `Identifier` uses `Cyan` (14,
already bright) with bold — so this setting does not change its color, but it does mean
that any group with a dark color + bold would render bright. The Neovim colorscheme
replicates this by using the bright hex values directly and setting `bold = true`.

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

From `~/.config/alacritty/alacritty.toml`:

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

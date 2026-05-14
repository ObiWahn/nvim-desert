-- Three-layer color architecture:
--   palette.lua   raw hex values keyed by terminal color name (bg, fg, black…br_white)
--   theme.lua     semantic roles — this file; maps roles to palette entries via `c.*`
--                 NEVER assign raw hex here; always go through c.*
--   highlights.lua  maps Neovim highlight groups to roles; no color values of its own
--
-- Role colors follow vim's default colorscheme cterm assignments for a dark background,
-- resolved to hex via the Alacritty palette (see README). Alacritty is configured with
-- draw_bold_text_with_bright_colors=true, so bold text on normal colors renders bright.

local palette = require("nvim-desert.palette")
local c = palette.colors

local M = {}

M.roles = {
    -- Editor chrome
    bg              = c.bg,
    bg_dark         = c.bg_dark,
    bg_light        = c.bg_light,
    bg_lighter      = c.bg_lighter,
    fg              = c.fg,
    fg_dim          = c.white,
    fg_bright       = c.bright_fg,
    cursor_line     = c.cursor_line,
    selection       = c.selection,
    non_text        = c.br_black,
    line_nr         = c.yellow,        -- Vim LineNr = DarkYellow (ANSI 3)
    cursor_line_nr  = c.yellow,
    match_paren     = c.br_yellow,
    fold            = c.br_black,

    -- Syntax
    comment         = c.blue,          -- Vim Comment   = DarkBlue (ANSI 4)
    doc_comment     = c.blue,          -- SpecialComment → Comment
    constant        = c.red,            -- Vim Constant  = Red (ANSI 1)
    string          = c.red,            -- String → Constant
    string_escape   = c.br_magenta,   -- SpecialChar → Special
    character       = c.red,            -- Character → Constant
    number          = c.red,            -- Number → Constant
    boolean         = c.red,            -- Boolean → Constant
    ["function"]    = c.br_cyan,      -- Function → Identifier = Cyan bold (ANSI 14)
    func_builtin    = c.br_cyan,
    method          = c.br_cyan,      -- also Identifier
    keyword         = c.yellow,        -- Vim Statement = Yellow (ANSI 3)
    keyword_modifier = c.green,        -- modifiers: const, static, override, public…
    keyword_operator = c.yellow,       -- operator keywords: new, delete
    keyword_return  = c.yellow,        -- Exception → Statement
    operator        = c.br_yellow,    -- operators: <<, &, =, …
    type            = c.blue,           -- classes/types = blue (ANSI 4)
    type_builtin    = c.green,          -- builtin types (int, float, bool…)
    storage         = c.green,         -- StorageClass → Type (ANSI 2)
    structure       = c.green,         -- Structure → Type (ANSI 2)
    macro           = c.magenta,       -- PreProc = Magenta (ANSI 5)
    preproc         = c.magenta,
    include         = c.magenta,
    label           = c.yellow,        -- Label → Statement
    special         = c.br_magenta,   -- Vim Special   = Magenta (ANSI 5)
    delimiter       = c.fg,            -- () {} [] , ; in normal foreground
    bracket         = c.fg,            -- brackets in normal foreground
    variable        = c.fg,
    variable_builtin = c.yellow,       -- this, self
    field           = c.cyan,
    parameter       = c.white,
    namespace       = c.br_cyan,
    tag             = c.br_red,       -- Tag → Special
    tag_attr        = c.yellow,
    tag_delim       = c.br_red,       -- Delimiter → Special
    todo            = c.black,        -- Vim Todo ctermfg=Black ctermbg=Yellow
    todo_bg         = c.br_yellow,
    error_token     = c.br_red,

    -- Diff
    diff_add        = c.green,
    diff_change     = c.yellow,
    diff_delete     = c.red,
    diff_text       = c.br_yellow,

    -- Diagnostics
    diag_error      = c.br_red,
    diag_warn       = c.br_yellow,
    diag_info       = c.blue,
    diag_hint       = c.cyan,
    diag_ok         = c.green,

    -- UI widgets
    pmenu_bg        = c.bg_dark,
    pmenu_sel_bg    = c.blue,
    pmenu_sel_fg    = c.bg,
    pmenu_thumb     = c.br_black,
    statusline_bg   = c.bg_dark,
    statusline_fg   = c.fg,
    statusline_nc   = c.black,
    tabline_bg      = c.bg_dark,
    tabline_sel     = c.fg,
    border          = c.bg_lighter,
    search_bg       = c.yellow,
    search_fg       = c.bg,
    incsearch_bg    = c.br_yellow,
    incsearch_fg    = c.bg,
    visual          = c.selection,
    title           = c.br_cyan,
    directory       = c.blue,
    special_key     = c.br_black,
    warning_msg     = c.br_yellow,
    error_msg       = c.br_red,

    -- LSP references
    lsp_ref         = c.bg_light,
    lsp_ref_read    = c.bg_light,
    lsp_ref_write   = c.bg_lighter,
    inlay_hint      = c.br_black,
}

return M

local palette = require("vim-desert.palette")
local c = palette.colors

local M = {}

-- Semantic color roles. Swap this file (or pass overrides to setup()) to change the theme.
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
    line_nr         = c.yellow,       -- Vim LineNr = DarkYellow (ANSI 3)
    cursor_line_nr  = c.yellow,
    match_paren     = c.br_yellow,
    fold            = c.br_black,

    -- Syntax
    comment         = c.br_cyan,      -- Vim Comment   = Cyan   (ANSI 14)
    doc_comment     = c.br_cyan,      -- SpecialComment → Comment
    constant        = c.br_magenta,   -- Vim Constant  = Magenta (ANSI 13)
    string          = c.br_magenta,   -- String → Constant
    string_escape   = c.br_red,       -- SpecialChar → Special  (ANSI 9)
    character       = c.br_magenta,   -- Character → Constant
    number          = c.br_magenta,   -- Number → Constant
    boolean         = c.br_magenta,   -- Boolean → Constant
    ["function"]    = c.br_cyan,      -- Function → Identifier = Cyan bold (ANSI 14)
    func_builtin    = c.br_cyan,
    method          = c.br_cyan,      -- also Identifier
    keyword         = c.br_yellow,    -- Vim Statement = Yellow (ANSI 11)
    keyword_return  = c.br_yellow,    -- Exception → Statement
    operator        = c.br_yellow,    -- Operator → Statement
    type            = c.br_green,     -- Vim Type      = LightGreen (ANSI 10)
    type_builtin    = c.br_green,     -- Type
    storage         = c.br_green,     -- StorageClass → Type
    structure       = c.br_green,     -- Structure → Type
    macro           = c.br_blue,      -- Vim PreProc   = LightBlue (ANSI 12)
    preproc         = c.br_blue,
    include         = c.br_blue,
    label           = c.br_yellow,    -- Label → Statement
    special         = c.br_red,       -- Vim Special   = LightRed (ANSI 9)
    delimiter       = c.br_red,       -- Delimiter → Special
    variable        = c.fg,
    variable_builtin = c.br_red,      -- Special
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

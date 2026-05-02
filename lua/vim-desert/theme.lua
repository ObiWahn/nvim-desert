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
    line_nr         = c.black,
    cursor_line_nr  = c.yellow,
    match_paren     = c.br_yellow,
    fold            = c.br_black,

    -- Syntax
    comment         = c.br_black,
    doc_comment     = c.black,
    constant        = c.br_yellow,
    string          = c.yellow,
    string_escape   = c.br_cyan,
    character       = c.yellow,
    number          = c.br_yellow,
    boolean         = c.br_yellow,
    ["function"]    = c.blue,
    func_builtin    = c.br_cyan,
    method          = c.blue,
    keyword         = c.br_magenta,
    keyword_return  = c.br_red,
    operator        = c.white,
    type            = c.br_cyan,
    type_builtin    = c.cyan,
    storage         = c.magenta,
    structure       = c.br_cyan,
    macro           = c.br_blue,
    preproc         = c.br_blue,
    include         = c.br_blue,
    label           = c.br_yellow,
    special         = c.br_cyan,
    delimiter       = c.white,
    variable        = c.fg,
    variable_builtin = c.br_red,
    field           = c.cyan,
    parameter       = c.white,
    namespace       = c.br_cyan,
    tag             = c.red,
    tag_attr        = c.yellow,
    tag_delim       = c.br_black,
    todo            = c.br_yellow,
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

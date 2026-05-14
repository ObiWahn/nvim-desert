local M = {}

M.colors = {
    -- Primary
    bg           = "#333333",
    fg           = "#fffdb3",
    bright_fg    = "#ffffff",

    -- Normal (0-7)
    black        = "#666666",
    red          = "#E0546A",
    green        = "#3CC85E",
    yellow       = "#FCBF35",
    blue         = "#5087C8",
    magenta      = "#9E00DE",
    cyan         = "#008A8B",
    white        = "#eaeaea",

    -- Bright (8-15)
    br_black     = "#5B5252",
    br_red       = "#E91537",
    br_green     = "#2CFF2C",
    br_yellow    = "#FF8538",
    br_blue      = "#525EFF",
    br_magenta   = "#B04AD9",
    br_cyan      = "#4DEEC7",
    br_white     = "#ffffff",

    -- Derived UI shades
    bg_dark      = "#2a2a2a",
    bg_light     = "#3d3d3d",
    bg_lighter   = "#454545",
    cursor_line  = "#3a3a3a",
    selection    = "#4a3f3f",
    none         = "NONE",
}

return M

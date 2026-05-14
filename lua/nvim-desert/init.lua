local M = {}

-- setup({ roles = { keyword = "#rrggbb", ... } })
-- Any keys in opts.roles override the default theme roles.
function M.setup(opts)
    opts = opts or {}

    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") == 1 then
        vim.cmd("syntax reset")
    end
    vim.g.colors_name = "nvim-desert"
    vim.o.termguicolors = true

    local theme = require("nvim-desert.theme")
    local roles = theme.roles

    if opts.roles then
        roles = vim.tbl_extend("force", roles, opts.roles)
    end

    require("nvim-desert.highlights").apply(roles)
end

return M

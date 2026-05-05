-- General Buffer Settings
local opt               = vim.opt
opt.tabstop             = 4
opt.shiftwidth          = 4
opt.expandtab           = true
opt.relativenumber      = true
opt.exrc                = true
opt.wrap                = false

-- NetRW Buffer Settings
vim.g.netrw_bufsettings = 'noma nomod nonu nobl nowrap ro rnu'

-- Diagnostic Settings
---@type vim.diagnostic.Opts
local diagnostic_opts = {
    underline = false,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = 'E',
            [vim.diagnostic.severity.WARN] = 'W',
            [vim.diagnostic.severity.HINT] = 'H',
            [vim.diagnostic.severity.INFO] = 'I'
        },
    },
    virtual_lines = false,
    virtual_text = false,
}

vim.diagnostic.config(diagnostic_opts)

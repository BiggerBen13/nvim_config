vim.pack.add({
    'https://github.com/rebelot/kanagawa.nvim',
    'https://github.com/ibhagwan/fzf-lua',
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/OXY2DEV/markview.nvim',
})

-- activate colorscheme
vim.cmd.colorscheme('kanagawa-dragon')

-- fzf-lua configuration
local map = vim.keymap.set
local fzf = require('fzf-lua')

fzf.setup {}

map('n', '<leader>ff', fzf.files, {})
map('n', '<leader>fg', fzf.live_grep, {})
map('n', '<leader>fb', fzf.buffers, {})

local treesitter = require('nvim-treesitter')
treesitter.setup {
    install_dir = vim.fn.stdpath('data') .. '/site',
}

local treesitter_languages = {
    'odin',
    'zig',
    'rust',
    'c',
    'nu'
}

treesitter.install(treesitter_languages)

-- enable treesitter for different filetypes
vim.api.nvim_create_autocmd('FileType', {
    pattern = treesitter_languages,
    callback = function()
        -- syntax highlighting, provided by Neovim
        vim.treesitter.start()
        -- folds, provided by Neovim
        -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        -- vim.wo.foldmethod = 'expr'
        -- indentation, provided by nvim-treesitter
        -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})

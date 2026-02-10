---@type Plugin[]
local plugins = {
    {
        spec = 'https://github.com/rebelot/kanagawa.nvim',
        config = function() vim.cmd.colorscheme 'kanagawa-dragon' end,
    },
    {
        spec = 'https://github.com/ibhagwan/fzf-lua',
        config = function() require 'plugins.fzf' end
    },
    { spec = 'https://github.com/neovim/nvim-lspconfig', },
}


require('plugins.loader').load(plugins)

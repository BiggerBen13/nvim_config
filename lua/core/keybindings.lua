local map = vim.keymap.set
vim.g.mapleader = ' ';
vim.g.localmapleader = '\\';

map('n', '<leader>.', vim.cmd.Ex, { desc = 'open Explore' })

map('n', 'gK', function()
    local current_config = vim.diagnostic.config()
    if current_config == nil then
        vim.notify_once("Couldn't get diagnostic config")
        return
    end

    vim.diagnostic.config({
        virtual_lines = not current_config.virtual_lines,
        virtual_text = false
    })
end, { desc = 'Toggle virtual lines' })

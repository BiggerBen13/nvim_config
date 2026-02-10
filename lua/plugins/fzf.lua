local map = vim.keymap.set
local fzf = require('fzf-lua')

fzf.setup {}

map('n', '<leader>ff', fzf.files, {})
map('n', '<leader>fg', fzf.live_grep, {})
map('n', '<leader>fb', fzf.buffers, {})

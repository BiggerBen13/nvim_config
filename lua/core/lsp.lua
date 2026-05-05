-- This file does lsp configuration
local servers = {
    -- interpreted/scripting
    'basedpyright',
    'nushell',
    'lua_ls',

    -- c/cpp
    'clangd',

    -- web
    'cssls',
    'biome',
    'html',
    -- 'typescript-language-server', -- this is unfortunately needed because the web is evil
    -- 'tailwindcss-language-server',

    -- modern compiled
    'rust_analyzer',
    'ols',
    'gopls',
    'zls',
    'sourcekit',

    -- functional languages
    'elmls',
    'hls',
    'nixd',

    -- configuration
    'taplo',
    'jsonls',

    -- shader
    'glsl_analyzer',

    -- java
    'jdtls',

    -- markup
    'tinymist',

    -- fun
    "uiua",
}

---@param args vim.api.keyset.create_autocmd.callback_args
local function on_attach(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local buf = args.buf

    if not client then
        vim.notify("couldn't find lsp client", vim.log.levels.ERROR)
        return
    end

    if client:supports_method('textDocument/formatting') then
        vim.keymap.set({ 'n', 'v' }, 'grF', function() vim.lsp.buf.format({ bufnr = buf, async = true }) end,
            { desc = 'formats the buffer', buffer = buf })
    end

    if client:supports_method('textDocument/completion') then
        vim.lsp.completion.enable(true, client.id, buf, { autotrigger = false })
        -- vim.keymap.del('i', '<C-x><C-o>', { buffer = buf })
        -- vim.keymap.set('i', '<C-x><C-o>', function() vim.lsp.completion.get() end, { buffer = buf, desc = {'trigger lsp completion'} })
    end
end

vim.api.nvim_create_autocmd('LspAttach', {
    callback = on_attach
})

vim.lsp.enable(servers)

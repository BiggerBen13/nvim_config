-- This file does lsp configuration
local servers = {
    "jsonls",
    "lua_ls",
    "clangd",
    "rust_analyzer",
    "hls",
    "ols",
    "glsl_analyzer",
    "jdtls",
    "zls",
    "gopls",
    "elmls",
}

---@param args vim.api.keyset.create_autocmd.callback_args
local function on_attach(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local buf = args.buf

    if not client then
        vim.notify("couldn't find lsp client", vim.log.levels.ERROR)
        return
    end

    if client:supports_method("textDocument/formatting") then
        vim.keymap.set({"n", "v"}, "grF", function() vim.lsp.buf.format({bufnr = buf, async = true}) end, {desc = "formats the buffer", buffer = buf})
    end

    if client:supports_method("textDocument/completion") then
        vim.lsp.completion.enable(true, client.id, buf, {autotrigger = false})
        -- vim.keymap.del("i", "<C-x><C-o>", { buffer = buf })
        -- vim.keymap.set("i", "<C-x><C-o>", function() vim.lsp.completion.get() end, { buffer = buf, desc = {"trigger lsp completion"} })
    end
end

vim.api.nvim_create_autocmd("LspAttach", {
    callback = on_attach
})

vim.lsp.enable(servers)

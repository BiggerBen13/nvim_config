local opt = vim.opt
local uv = vim.uv
local pack = vim.pack

---@class PluginLoader
local M = {}

---@param plugins Plugin[]
function M.load(plugins)
    for _, plugin in ipairs(plugins) do
        pack.add({ plugin.spec })
        if plugin.config then plugin.config() end
    end
end

return M

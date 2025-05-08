-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Autoformat setting
local set_autoformat = function(pattern, bool_val)
    vim.api.nvim_create_autocmd({ "FileType" }, {
        pattern = pattern,
        callback = function()
            vim.b.autoformat = bool_val
        end,
    })
end

set_autoformat({ "java" }, true)
set_autoformat({ "cpp" }, false)
-- set_autoformat({ "fish" }, false)
-- set_autoformat({ "lua" }, true)
set_autoformat({ "dart" }, false)
-- set_autoformat({ "yaml" }, false)

vim.api.nvim_create_autocmd("FileType", {
    pattern = "dart",
    callback = function()
        vim.opt_local.tabstop = 2 -- Tabs count as 2 spaces
        vim.opt_local.shiftwidth = 2 -- Indentation uses 2 spaces
        vim.opt_local.softtabstop = 2 -- Backspace removes 2 spaces
        vim.opt_local.expandtab = true -- Use spaces instead of tabs
    end,
})

vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- disable auto conceal of back ticks and annoying stuff like that
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.wo.conceallevel = 0
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "sql", -- Only activates for SQL files
    callback = function()
        vim.keymap.set("n", "<leader>h", ":normal vip<CR><PLUG>(DBUI_ExecuteQuery)", { buffer = true })
    end,
})

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

set_autoformat({ "java" }, false)
-- set_autoformat({ "cpp" }, true)
-- set_autoformat({ "fish" }, false)
-- set_autoformat({ "lua" }, true)
set_autoformat({ "dart" }, false)
-- set_autoformat({ "yaml" }, false)

vim.api.nvim_create_autocmd("FileType", {
  pattern = "dart",
  callback = function()
    vim.opt_local.tabstop = 2       -- Tabs count as 2 spaces
    vim.opt_local.shiftwidth = 2    -- Indentation uses 2 spaces
    vim.opt_local.softtabstop = 2   -- Backspace removes 2 spaces
    vim.opt_local.expandtab = true  -- Use spaces instead of tabs
  end,
})


local auto_save_enabled = true

vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave", "BufLeave" }, {
    pattern = "*",

    callback = function()
        local filetype = vim.bo.filetype

        -- Define excluded filetypes
        local excluded_filetypes = { "oil", "buffer_manager" }

        -- Function to check if a value exists in a table
        local function is_excluded(value, list)
            for _, v in ipairs(list) do
                if v == value then
                    return true
                end
            end
            return false
        end

        -- Auto-save condition: must be enabled, modifiable, and not in the exclusion list
        if vim.bo.modifiable and not is_excluded(filetype, excluded_filetypes) then
            vim.cmd("silent! write")
        end
    end,
})

-- Make `auto_save_enabled` globally accessible for keymap toggle
vim.g.auto_save_enabled = auto_save_enabled

vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")


-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jj", "<ESC>", { silent = true })

-- buffer manager ---------------

-- Keybinding for Buffer Manager
-- https://github.com/j-morano/buffer_manager.nvim
-- vim.keymap.set("n", "<C-Tab>", ":lua require('buffer_manager.ui').toggle_quick_menu()<CR>", {
--     desc = "Toggle Buffer Manager",
--     noremap = true,
--     silent = true,
-- })

local buffer_manager = require("buffer_manager.ui")

-- State tracking for menu
local menu_open = false

-- Open or toggle the menu
vim.keymap.set("n", "<C-Tab>", function()
    if not menu_open then
        buffer_manager.toggle_quick_menu()
        menu_open = true
    else
        -- Navigate down in the menu
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Down>", true, false, true), "n", true)
    end
end, {
    desc = "Open/Toggle Buffer Manager or Move Down",
    noremap = true,
    silent = true,
})

-- Navigate up in the menu with <C-S-Tab>
vim.keymap.set("n", "<C-S-Tab>", function()
    if menu_open then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Up>", true, false, true), "n", true)
    end
end, {
    desc = "Move Up in Buffer Manager Menu",
    noremap = true,
    silent = true,
})

-- Hook into the buffer selection (`<CR>`) to update menu state
vim.api.nvim_create_autocmd("BufWinLeave", {
    pattern = "*",
    callback = function()
        if menu_open then
            menu_open = false -- Close the menu state when leaving the buffer menu
        end
    end,
})

-- buffer manager ---------------

-- vim.keymap.set("n", "<A-s>", ":wa<CR>", { desc = "Save all buffers (Alt-S)" })
-- vim.keymap.set("i", "<A-s>", "<Esc>:wa<CR>i", { desc = "Save all buffers and return to insert mode (Alt-S)" })
--
vim.keymap.set("i", "<Tab><Tab>", "<Esc>==gi", {
    desc = "Auto indent in insert mode",
    noremap = true,
    silent = true,
})

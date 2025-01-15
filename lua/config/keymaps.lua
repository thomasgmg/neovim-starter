-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jj", "<ESC>", { silent = true })

-- Keybinding for Buffer Manager
-- https://github.com/j-morano/buffer_manager.nvim
vim.keymap.set("n", "<S-Tab>", ":lua require('buffer_manager.ui').toggle_quick_menu()<CR>", {
    desc = "Toggle Buffer Manager",
    noremap = true,
    silent = true,
})

-- vim.keymap.set("n", "<A-s>", ":wa<CR>", { desc = "Save all buffers (Alt-S)" })
-- vim.keymap.set("i", "<A-s>", "<Esc>:wa<CR>i", { desc = "Save all buffers and return to insert mode (Alt-S)" })
--
vim.keymap.set("i", "<Tab><Tab>", "<Esc>==gi", {
    desc = "Auto indent in insert mode",
    noremap = true,
    silent = true,
})

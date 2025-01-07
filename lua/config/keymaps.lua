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

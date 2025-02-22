-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jj", "<ESC>", { silent = true })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Page Down", silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Page Up", silent = true })

-- Build by running :make
vim.keymap.set("n", "<C-b>", "<cmd>make<cr>", { desc = "Build make" })

-- Map F3 to go to definition (same as gd)
-- vim.keymap.set("n", "<F3>", vim.lsp.buf.definition, { desc = "Goto Definition", remap = false })
vim.keymap.set("n", "<F3>", "gd", { desc = "Go to definition", remap = true })

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jj", "<ESC>", { silent = true })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Page Down", silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Page Up", silent = true })

-- vim.keymap.set("i", "<Tab><Tab>", "<Esc>==gi", {
--     desc = "Auto indent in insert mode",
--     noremap = true,
--     silent = true,
-- })

vim.keymap.set("n", "<leader>bs", function()
    vim.g.auto_save_enabled = not vim.g.auto_save_enabled
    print("Auto-save " .. (vim.g.auto_save_enabled and "enabled" or "disabled"))
end, { desc = "Toggle Auto-Save" })

-- Build by running :make
vim.keymap.set("n", "<C-b>", "<cmd>make<cr>", { desc = "Build make" })


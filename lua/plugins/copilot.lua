return {
    "github/copilot.vim",
    config = function()
        vim.g.copilot_enabled = 0
        vim.g.copilot_no_tab_map = 0

        -- Define keymaps using LazyVim's style
        local keymap = vim.keymap.set

        -- Insert mode keymaps for Copilot
        keymap("i", "<C-l>", "<Plug>(copilot-accept)", { desc = "Accept Copilot suggestion" })
        keymap("i", "<C-]>", "<Plug>(copilot-next)", { desc = "Next Copilot suggestion" })
        keymap("i", "<C-[>", "<Plug>(copilot-previous)", { desc = "Previous Copilot suggestion" })
        keymap("i", "<C-\\>", "<Plug>(copilot-dismiss)", { desc = "Dismiss Copilot suggestion" })
        keymap("i", "<C-s>", "<Plug>(copilot-suggest)", { desc = "Trigger Copilot suggestion" })

        -- Optional: Normal mode keymap to toggle Copilot
        keymap("n", "<leader>ce", ":Copilot enable<CR>", { desc = "Enable Copilot" })
        -- keymap("n", "<leader>cd", ":Copilot disable<CR>", { desc = "Disable Copilot" })
    end,
}

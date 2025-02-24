return {
    "github/copilot.vim",
    event = "VeryLazy",

    config = function()
        vim.g.copilot_enabled = 0
        vim.g.copilot_no_tab_map = 0

        -- Helper functions for partial acceptance
        local function accept_word()
            vim.fn["copilot#Accept"]("")
            local suggestion = vim.fn["copilot#TextQueuedForInsertion"]()
            local words = vim.split(suggestion, "%s+")
            return words[1] or ""
        end

        local function accept_line()
            vim.fn["copilot#Accept"]("")
            local suggestion = vim.fn["copilot#TextQueuedForInsertion"]()
            local lines = vim.split(suggestion, "\n")
            return lines[1] or ""
        end

        local keymap = vim.keymap.set

        -- Insert mode keymaps for Copilot
        keymap("i", "<C-l>", "<Plug>(copilot-accept)", { desc = "Accept Copilot suggestion" })
        keymap("i", "<C-]>", "<Plug>(copilot-next)", { desc = "Next Copilot suggestion" })
        keymap("i", "<C-[>", "<Plug>(copilot-previous)", { desc = "Previous Copilot suggestion" })
        keymap("i", "<C-\\>", "<Plug>(copilot-dismiss)", { desc = "Dismiss Copilot suggestion" })
        keymap("i", "<C-S-Space>", "<Plug>(copilot-suggest)", { desc = "Trigger Copilot suggestion" })
        keymap("i", "<C-Right>", function()
            return accept_word()
        end, { expr = true, desc = "Accept next Copilot word" })
        keymap("i", "<C-S-Right>", function()
            return accept_line()
        end, { expr = true, desc = "Accept next Copilot line" })

        -- Optional: Normal mode keymap to toggle Copilot
        keymap("n", "<leader>ce", ":Copilot enable<CR>", { desc = "Enable Copilot" })
        -- keymap("n", "<leader>cd", ":Copilot disable<CR>", { desc = "Disable Copilot" })
    end,
}

-- if true then
--     return {}
-- end
return {
    {
        "zbirenbaum/copilot.lua",
        -- cmd = "Copilot",
        -- event = "InsertEnter",

        opts = {
            suggestion = {
                enabled = true, -- Enable ghost text
                auto_trigger = true, -- Show suggestions as you type
                debounce = 75, -- Delay in ms before showing suggestions
                keymap = {
                    -- accept = "<C-l>", -- Accept full suggestion
                    accept_word = "<C-S-Right>", -- Accept next word
                    accept_line = "<C-Right>", -- Accept next line
                    next = "<C-]>", -- Next suggestion
                    prev = "<C-[>", -- Previous suggestion
                    dismiss = "<C-\\>", -- Dismiss suggestion
                },
            },
            panel = {
                enabled = false, -- Disable panel if you prefer ghost text only
            },
        },
    },
    -- {
    --     "github/copilot.vim",
    --     event = "VeryLazy",
    --
    --     config = function()
    --         vim.g.copilot_enabled = 0
    --         vim.g.copilot_no_tab_map = 0
    --
    --         local keymap = vim.keymap.set
    --
    --         keymap("i", "<C-l>", "<Plug>(copilot-accept)", { desc = "Accept Copilot suggestion" })
    --         keymap("i", "<C-]>", "<Plug>(copilot-next)", { desc = "Next Copilot suggestion" })
    --         keymap("i", "<C-[>", "<Plug>(copilot-previous)", { desc = "Previous Copilot suggestion" })
    --         keymap("i", "<C-\\>", "<Plug>(copilot-dismiss)", { desc = "Dismiss Copilot suggestion" })
    --         keymap("i", "<C-S-Space>", "<Plug>(copilot-suggest)", { desc = "Trigger Copilot suggestion" })
    --         keymap("i", "<C-S-Right>", "<Plug>(copilot-accept-word)")
    --         keymap("i", "<C-Right>", "<Plug>(copilot-accept-line)")
    --
    --         keymap("n", "<leader>ce", ":Copilot enable<CR>", { desc = "Enable Copilot" })
    --         -- conflicts with another keymap
    --         -- keymap("n", "<leader>cd", ":Copilot disable<CR>", { desc = "Disable Copilot" })
    --     end,
    -- },
}

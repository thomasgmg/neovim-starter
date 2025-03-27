return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        spec = { -- Use the new 'spec' key for mappings
            {
                "<leader>m", -- The prefix for the group
                group = "table mode", -- The group name
            },
        },
    },
}

return {
    "stevearc/oil.nvim",
    event = "VeryLazy",

    ---@module 'oil'
    ---@type oil.SetupOpts

    opts = {
        view_options = {
            -- Show files and directories that start with "."
            show_hidden = true,
        },
        keymaps = {
            -- ["-"] = "<CMD>Oil<CR>",
            ["<CR>"] = "actions.select", -- This will map <CR> to select
            ["<C-l>"] = "actions.select", -- You can use any other key combination if you like
        },
    },

    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,

    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
}

-- https://grok.com/share/bGVnYWN5_6adaf8e3-9d1f-40d6-be44-dfef9d16100d

return {
    -- uncomment for testing local changes
    -- {
    --     dir = "~/projects/nvim/neodarcula.nvim", -- Path to your local plugin
    --     -- name = "neodarcula",
    --     lazy = false, -- Load immediately for testing
    --     priority = 1000, -- Ensure it loads early
    --
    --     opts = {
    --         transparent = true,
    --     },
    -- },
    {
        "pmouraguedes/neodarcula.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = true,
        },
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "neodarcula",
        },
    },
}

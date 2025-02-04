return {

    -- { "doums/darcula" },
    { "ellisonleao/gruvbox.nvim" },
    {
        "rebelot/kanagawa.nvim",
        opts = {
            transparent = true,
            dimInactive = true,
        },
    },
    -- zenbones
    {
        "zenbones-theme/zenbones.nvim",
        -- Optionally install Lush. Allows for more configuration or extending the colorscheme
        -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
        -- In Vim, compat mode is turned on as Lush only works in Neovim.
        dependencies = "rktjmp/lush.nvim",
        lazy = false,
        priority = 1000,

        -- you can set set configuration options here
        -- config = function()
        --     vim.g.zenbones_darken_comments = 45
        --     vim.cmd.colorscheme('zenbones')
        -- end

        -- transparent background
        -- config = function()
        --     vim.g.zenbones_transparent = true -- Enable transparent background
        --     vim.g.zenbones_lightness = "dim" -- Adjust lightness (optional)
        --
        --     -- -- Set the colorscheme
        --     -- vim.cmd.colorscheme("zenbones")
        --
        --     -- Ensure backgrounds are cleared
        --     vim.cmd([[highlight Normal guibg=NONE ctermbg=NONE]])
        --     vim.cmd([[highlight NormalNC guibg=NONE ctermbg=NONE]])
        --     vim.cmd([[highlight LineNr guibg=NONE ctermbg=NONE]])
        --     vim.cmd([[highlight SignColumn guibg=NONE ctermbg=NONE]])
        --     vim.cmd([[highlight EndOfBuffer guibg=NONE ctermbg=NONE]])
        -- end,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "kanagawa",
            -- colorscheme = "tokyonight-night",

            keys = {
                -- Remove LSP signature help on <C-k>
                { "<C-k>", false, mode = "i" },
            },
        },
    },
}

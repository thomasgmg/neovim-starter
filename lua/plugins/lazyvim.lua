return {

    { "doums/darcula" },
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
        "axvr/photon.vim",
    },
    {
        "alligator/accent.vim",
    },
    {
        "davidosomething/vim-colors-meh",
    },
    {
        "mcauley-penney/ice-cave.nvim",
        opts = {
            transparent = true,
            dimInactive = true,
        },
        config = function()
            -- vim.cmd.colorscheme("ice-cave")
        end,
        priority = 1000,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            -- colorscheme = "kanagawa",
            colorscheme = "default",
            -- colorscheme = "photon",
            -- colorscheme = "accent",
            -- colorscheme = "meh",
            -- colorscheme = "ice-cave",
            -- colorscheme = "darcula",
            -- colorscheme = "tokyonight-night",

            keys = {
                -- Remove LSP signature help on <C-k>
                { "<C-k>", false, mode = "i" },
            },
        },
    },
    {
        "nvim-lua/plenary.nvim", -- Ensures proper ordering
        config = function()
            vim.cmd.colorscheme("default")

            -- Explicitly set transparency
            local highlights = {
                "Normal",
                "NormalNC",
                "LineNr",
                "SignColumn",
                "EndOfBuffer",
                "CursorLine",
                "CursorLineNr",
                "StatusLine",
                "StatusLineNC",
            }

            for _, group in ipairs(highlights) do
                vim.cmd("highlight " .. group .. " guibg=NONE ctermbg=NONE")
            end

            -- Transparent background for the active window
            vim.cmd([[highlight Normal guibg=NONE ctermbg=NONE]])
            vim.cmd([[highlight SignColumn guibg=NONE ctermbg=NONE]])
            vim.cmd([[highlight EndOfBuffer guibg=NONE ctermbg=NONE]])

            -- Dim inactive windows
            vim.cmd([[highlight NormalNC guibg=#1e1e1e ctermbg=NONE]]) -- Darker background
            vim.cmd([[highlight LineNr guibg=NONE ctermbg=NONE]]) -- Keep line numbers normal
        end,
    },
}

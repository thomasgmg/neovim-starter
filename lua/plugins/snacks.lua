return {
    {
        "folke/snacks.nvim",
        ---@type snacks.Config
        opts = {
            picker = {
                formatters = {
                    file = {
                        filename_first = true, -- display filename before the file path
                        truncate = 160, -- truncate the file path to (roughly) this length
                        filename_only = false, -- only show the filename
                        icon_width = 2, -- width of the icon (in characters)
                        git_status_hl = true, -- use the git status highlight group for the filename
                    },
                },
                layout = {
                    preset = "vertical",
                },
            },
            input = {
                -- your input configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            },
            terminal = {
                -- your terminal configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
                win = {
                    height = 0.9,
                },
            },
        },
    },
}

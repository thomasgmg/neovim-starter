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
            dashboard = {
                enabled = true,
                preset = {
                    header = [[
                                    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
                                    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
                                    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
                                    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
                                    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
                                    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝


              __-----_____
             (      |  |  ---_
            /  ()    '-'      |
      __---/                   \-_____
     / *                              -------_____
    |                                             ----_____________________________
    \                                                                              --___
     --_________--/ \                                                                   \__
                      \                                                                    \__                              ___
                       |                                                                       --___                       /   |
                      /                                                                             --_                 __-  __-
                     /          _-_                                                            ____    -----_________---___--
                    |          /   --____                              ___\                   /  \  ---______   _____---
                    |        _/       |   --______                __---     \                 |   \          ---
                    /       /  \__     \          ----------------           \_               /    \
                   /      /       \     \                                      --__\         /_     |
                  /      /         \     \                                           \      /  \     \
                 /     -/           \     \                                           |     |   \     |
                |     /              |     |                                         /     |     \     )
               /     /               |     |                                        /     /      |     |
          _ _ /     /            ____|     |                                   ____/     /       |     |
         /         /            /         /                                   /         /        /     /
         \_ _ _ _ /             \________/                                    \________/         (____|
                    ]],
                },
                sections = {
                    --     { section = "header", width = 100000000 },
                    --     { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
                    --     { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                    --     { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                    --     { section = "startup" },
                    { section = "header" },
                    {
                        pane = 2,
                        icon = " ",
                        section = "keys",
                        title = "Keymaps",
                        indent = 2,
                        padding = 1,
                    },
                    {
                        pane = 2,
                        icon = " ",
                        title = "Recent Files",
                        section = "recent_files",
                        indent = 2,
                        padding = 1,
                    },
                    { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                    {
                        pane = 2,
                        icon = "",
                        title = "Git Status",
                        section = "terminal",
                        enabled = function()
                            return Snacks.git.get_root() ~= nil
                        end,
                        cmd = "git status --short --branch --renames",
                        height = 5,
                        padding = 1,
                        ttl = 5 * 60,
                        indent = 2,
                    },
                    { section = "startup" },
                },
                formats = {
                    header = { "%s", align = "left", width = 130 },
                },
            },
        },
    },
}

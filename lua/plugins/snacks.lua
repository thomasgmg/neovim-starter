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

 ,--.--------.        ___       _,---.
/==/,  -   , -\.-._ .'=.'\  _.='.'-,  \                         ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
\==\.-.  - ,-./==/ \|==|  |/==.'-     /                         ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
 `--`\==\- \  |==|,|  / - /==/ -   .-'                          ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
      \==\_ \ |==|  \/  , |==|_   /_,-.                         ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
      |==|- | |==|- ,   _ |==|  , \_.' )                        ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
      |==|, | |==| _ /\   \==\-  ,    (          __..._         ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
      /==/ -/ /==/  / / , //==/ _  ,  /      ..-'      o.
      `--`--` `--`./  `--` `--`------'    .-'            :
                                     _..'             .'__..--<
                              ...--""                 '-.
                          ..-"                       __.'
                        .'                  ___...--'
                       :        ____....---'
                      :       .'
                     :       :           _____
                     :      :    _..--"""     """--..__
                    :       :  ."                      ""i--.
                    :       '.:                         :    '.
                    :         '--...___i---""""--..___.'      :
                     :                 ""---...---""          :
                      '.                                     :
                        '-.                                 :
                           '--...                         .'
                             :   ""---....._____.....---""
                                 '.    '.
                                   '-..  '.
                                       '.  :
                                        : .'
                                       /  :
                                     .'   :
                                   .' .--'
                                  '--'
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
                        -- icon = "  ",
                        title = "Recent Files",
                        section = "recent_files",
                        indent = 2,
                        padding = 1,
                    },
                    {
                        pane = 2,
                        icon = " ",
                        title = "Projects",
                        section = "projects",
                        indent = 2,
                        padding = 1,
                    },
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
                    {
                        pane = 2,
                        section = "startup",
                        padding = 1,
                    },
                },
                formats = {
                    header = { "%s", align = "left", width = 130 },
                },
            },
        },
    },
}

--  ______  __                                                                                                ____                         __
-- /\__  _\/\ \                                                  /'\_/`\                                     /\  _`\                      /\ \
-- \/_/\ \/\ \ \___      ___     ___ ___       __       ____    /\      \     ___    __  __   _ __    __     \ \ \L\_\   __  __     __    \_\ \      __     ____
--    \ \ \ \ \  _ `\   / __`\ /' __` __`\   /'__`\    /',__\   \ \ \__\ \   / __`\ /\ \/\ \ /\`'__\/'__`\    \ \ \L_L  /\ \/\ \  /'__`\  /'_` \   /'__`\  /',__\
--     \ \ \ \ \ \ \ \ /\ \L\ \/\ \/\ \/\ \ /\ \L\.\_ /\__, `\   \ \ \_/\ \ /\ \L\ \\ \ \_\ \\ \ \//\ \L\.\_   \ \ \/, \\ \ \_\ \/\  __/ /\ \L\ \ /\  __/ /\__, `\
--      \ \_\ \ \_\ \_\\ \____/\ \_\ \_\ \_\\ \__/.\_\\/\____/    \ \_\\ \_\\ \____/ \ \____/ \ \_\\ \__/.\_\   \ \____/ \ \____/\ \____\\ \___,_\\ \____\\/\____/
--       \/_/  \/_/\/_/ \/___/  \/_/\/_/\/_/ \/__/\/_/ \/___/      \/_/ \/_/ \/___/   \/___/   \/_/ \/__/\/_/    \/___/   \/___/  \/____/ \/__,_ / \/____/ \/___/
--
--             __-----_____
--           (      |  |  ---_
--          /  ()    '-'      |
--    __---/                   \-_____
--   / *                              -------_____
--  |                                             ----______________________
--  \                                                                       --___
--   --_________--/ \                                                            \__
--                    \                                                             \__                            ___
--                     |                                                                --___                     /   |
--                    /                                                                      --_               __-  __-
--                   /          _-_                                                     ____    -----_______---___--
--                  |          /   --____                       ___\                   /  \  ---______  ____---
--                  |        _/       |   --______         __---     \                 |   \          -
--                  /       /  \__     \          ---------           \_               /    \
--                 /      /       \     \                               --__\         /_     |
--                /      /         \     \                                    \      /  \     \
--               /     -/           \     \                                    |     |   \     |
--              |     /              |     |                                  /     |     \     )
--             /     /               |     |                                 /     /      |     |
--        _ _ /     /            ____|     |                            ____/     /       |     |
--       /         /            /         /                            /         /        /     /
--       \_ _ _ _ /             \________/                             \________/         (____|
--           *   )    )                          (  `                           (                   (
--         ` )  /( ( /(          )       )       )\))(          (   (       )   )\ )      (     (   )\ )   (
--          ( )(_)))\())  (     (     ( /(  (   ((_)()\   (    ))\  )(   ( /(  (()/(     ))\   ))\ (()/(  ))\ (
--         (_(_())((_)\   )\    )\  ' )(_)) )\  (_()((_)  )\  /((_)(()\  )(_))  /(_))_  /((_) /((_) ((_))/((_))\
--         |_   _|| |(_) ((_) _((_)) ((_)_ ((_) |  \/  | ((_)(_))(  ((_)((_)_  (_)) __|(_))( (_))   _| |(_)) ((_)
--           | |  | ' \ / _ \| '  \()/ _` |(_-< | |\/| |/ _ \| || || '_|/ _` |   | (_ || || |/ -_)/ _` |/ -_)(_-<
--           |_|  |_||_|\___/|_|_|_| \__,_|/__/ |_|  |_|\___/ \_,_||_|  \__,_|    \___| \_,_|\___|\__,_|\___|/__/

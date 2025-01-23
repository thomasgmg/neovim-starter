return {
    "ibhagwan/fzf-lua",

    opts = function(_, opts)
        local file_win_opts = {
            -- fullscreen = true,
            -- preview = {
            -- layout = "vertical",
            -- vertical = "up:70%",
            -- },
        }
        return {
            defaults = {
                -- formatter = "path.dirname_first",
                formatter = "path.filename_first",
            },
            files = {
                winopts = file_win_opts,
                previewer = false,
                cmd = "find",
                find_opts = [[-type f -not -path '*/\.git/*' -printf "%f\n"]],
            },
        }
    end,
}

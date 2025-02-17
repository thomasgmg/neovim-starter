if true then return {} end

return {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
        filesystem = {
            -- follow_current_file = true, -- Optional: automatically focus on the current file
            -- group_empty_dirs = false,   -- Optional: group empty directories
            mappings = {
                -- ["z"] = "close_all_nodes",  -- Close all nodes with `z`
                ["Z"] = "expand_all_nodes", -- Expand all nodes with `Z`
            },

            renderers = {
                directory = {
                    { "indent" },
                    { "icon" },
                    { "current_filter" },
                    {
                        "container",
                        content = {
                            { "name", zindex = 10 },
                            {
                                "symlink_target",
                                zindex = 10,
                                highlight = "NeoTreeSymbolicLinkTarget",
                            },
                            { "clipboard", zindex = 10 },
                            {
                                "diagnostics",
                                errors_only = true,
                                zindex = 20,
                                align = "right",
                                hide_when_expanded = true,
                            },
                            { "git_status", zindex = 10, align = "right", hide_when_expanded = true },
                            -- { "file_size", zindex = 10, align = "right" },
                            -- { "type", zindex = 10, align = "right" },
                            -- { "last_modified", zindex = 10, align = "right" },
                            -- { "created", zindex = 10, align = "right" },
                        },
                    },
                },
                file = {
                    { "indent" },
                    { "icon" },
                    {
                        "container",
                        content = {
                            {
                                "name",
                                zindex = 10,
                            },
                            {
                                "symlink_target",
                                zindex = 10,
                                highlight = "NeoTreeSymbolicLinkTarget",
                            },
                            { "clipboard", zindex = 10 },
                            { "bufnr", zindex = 10 },
                            -- { "modified", zindex = 20, align = "right" },
                            { "diagnostics", zindex = 20, align = "right" },
                            { "git_status", zindex = 10, align = "right" },
                            -- { "file_size", zindex = 10, align = "right" },
                            -- { "type", zindex = 10, align = "right" },
                            -- { "last_modified", zindex = 10, align = "right" },
                            -- { "created", zindex = 10, align = "right" },
                        },
                    },
                },
            },
        },
        window = {
            width = 80, -- Optional: Set Neo-tree window width
            mappings = {
                -- ["z"] = "close_all_nodes",  -- Close all nodes with `z`
                ["Z"] = "expand_all_nodes", -- Expand all nodes with `Z`
            },
        },
        -- event_handlers = {
        --   -- Optional: Automatically close Neo-tree when opening a file
        --   {
        --     event = "file_opened",
        --     handler = function(file_path)
        --       require("neo-tree").close_all()
        --     end,
        --   },
        -- },
    },
}

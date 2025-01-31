return {
    {
        "ibhagwan/fzf-lua",

        opts = function(_, opts)
            local file_win_opts = {
                -- fullscreen = true,
                preview = {
                    layout = "vertical",
                    vertical = "down:50%",
                },
            }
            return {
                defaults = {
                    -- formatter = "path.dirname_first",
                    formatter = "path.filename_first",
                },
                files = {
                    winopts = file_win_opts,
                    -- previewer = "false",
                    cmd = "find",
                    find_opts = [[-type f -not -path '*/\.git/*' -printf "%f\n"]],
                },
            }
        end,
    },
    -- uncomment to remove keys
    -- {
    --     "neovim/nvim-lspconfig",
    --     opts = function(_, opts)
    --         local Keys = require("lazyvim.plugins.lsp.keymaps").get()
    --
    --         vim.list_extend(Keys, {
    --             { "gr", "<Nop>" },
    --         })
    --     end,
    -- },
}

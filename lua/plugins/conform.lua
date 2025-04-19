return {
    "stevearc/conform.nvim",

    opts = {
        formatters_by_ft = {
            markdown = {}, -- No formatters
            sql = { "sqlfluff" },
        },
        formatters = {
            ["markdownlint-cli2"] = {
                -- Pass the config file explicitly. This avoid formatting tags (e.g. #cli to header: # cli)
                prepend_args = { "--config", vim.fn.expand("~/.markdownlint.json") },
            },
            sqlfluff = {
                command = "sqlfluff",
                args = { "format", "--dialect=ansi", "-" },
                require_cwd = false, -- Run without needing a root directory
            },
        },
    },
}

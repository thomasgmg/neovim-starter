return {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "stevearc/dressing.nvim", -- optional for vim.ui.select
    },

    config = true,
    opts = {
        debugger = {
            enabled = true,
            run_via_dap = true,
            exception_breakpoints = {},
        },
        widget_guides = { enabled = true },
        dev_tools = { auto_open_browser = false },

        lsp = {
            settings = {
                showTodos = true,
                completeFunctionCalls = true,
                -- analysisExcludedFolders = { "<path-to-flutter-sdk-packages>" },
                renameFilesWithClasses = "prompt", -- "always"
                enableSnippets = true,
                updateImportsOnRename = true, -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
            },
        },
    },
}

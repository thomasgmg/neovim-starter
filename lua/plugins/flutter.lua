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
    },
}

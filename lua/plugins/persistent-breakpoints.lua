return {
    "Weissle/persistent-breakpoints.nvim",
    event = "VeryLazy",
    dependencies = {
        {
            "mfussenegger/nvim-dap",
            keys = {
                { "<leader>db", false },
                { "<leader>dB", false },
            },
        },
    },
    event = "BufReadPost",
    opts = {
        save_dir = vim.fn.stdpath("data") .. "/nvim_checkpoints",
        -- when to load the breakpoints? "BufReadPost" is recommanded.
        load_breakpoints_event = "BufReadPost",
        -- load_breakpoints_event = nil,
        -- record the performance of different function. run :lua require('persistent-breakpoints.api').print_perf_data() to see the result.
        perf_record = false,
        -- perform callback when loading a persisted breakpoint
        -- @param opts DAPBreakpointOptions options used to create the breakpoint ({condition, logMessage, hitCondition})
        -- @param buf_id integer the buffer the breakpoint was set on
        -- @param line integer the line the breakpoint was set on
        on_load_breakpoint = nil,
    },
    keys = {
        {
            "<leader>db",
            function()
                require("persistent-breakpoints.api").toggle_breakpoint()
            end,
            silent = true,
            desc = "Toggle-Breakpoint",
            remap = false,
        },
        {
            "<leader>dB",
            function()
                require("persistent-breakpoints.api").set_conditional_breakpoint()
            end,
            silent = true,
            desc = "Conditional-Breakpoint",
            remap = false,
        },
        {
            "<leader>dx",
            function()
                require("persistent-breakpoints.api").clear_all_breakpoints()
            end,
            silent = true,
            desc = "Clear breakpoints",
            remap = false,
        },
    },
}

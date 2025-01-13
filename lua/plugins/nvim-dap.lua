return {
    {
        "folke/which-key.nvim",
        opts = {
            spec = {
                {
                    "<F6>",
                    function()
                        require("dap").step_over()
                    end,
                    desc = "Step Over",
                    mode = "n",
                },
                {
                    "<F8>",
                    function()
                        require("dap").continue()
                    end,
                    desc = "Continue",
                    mode = "n",
                },
                {
                    "<F5>",
                    function()
                        require("dap").step_into()
                    end,
                    desc = "Step Into",
                    mode = "n",
                },
            },
        },
    },
    -- {
    --     "mfussenegger/nvim-dap",
    --     keys = {
    --         {
    --             "<F6>",
    --             function()
    --                 require("dap").step_over()
    --             end,
    --             desc = "Step Over",
    --         },
    --     },
    -- },
}

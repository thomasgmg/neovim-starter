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
    {
        "mfussenegger/nvim-dap",
        opts = function(_, opts)
            local dap = require("dap")

            -- Add a new configuration for C/C++
            for _, lang in ipairs({ "c", "cpp" }) do
                table.insert(dap.configurations[lang], {
                    type = "codelldb",
                    request = "launch",
                    name = "Launch ./program no args",
                    program = "./program", -- Replace with your program's path
                    cwd = "${workspaceFolder}", -- Working directory
                    args = {}, -- Arguments for the program
                    stopOnEntry = false, -- Automatically start running
                })
            end

            -- Define a keymap for launching the custom debug configuration
            local function start_custom_debug()
                dap.run({
                    type = "codelldb",
                    request = "launch",
                    name = "Launch My Program",
                    program = "./program",
                    cwd = vim.fn.getcwd(),
                    args = {},
                    stopOnEntry = false,
                })
            end

            vim.keymap.set("n", "<F12>", start_custom_debug, { desc = "Start custom debug session" })
        end,
    },

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

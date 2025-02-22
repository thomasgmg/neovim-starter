return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
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
                {
                    "<F7>",
                    function()
                        require("dap").step_out()()
                    end,
                    desc = "Step Out",
                    mode = "n",
                },
            },
        },
    },
    {
        -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
        "mfussenegger/nvim-dap",
        event = "VeryLazy",

        dependencies = {
            "ldelossa/nvim-dap-projects", -- Project-based DAP configurations

            -- .nvim/nvim-dap.lua
            -- add this to this file ^^

            -- local dap = require("dap")

            -- dap.configurations.java = {
            -- 	{
            -- 		type = "java",
            -- 		request = "launch",
            -- 		name = "Custom - Launch MyApp",
            -- 		mainClass = "com.myapp.Main", -- Replace with your main class
            -- 		projectName = "MyJavaProject",
            -- 		args = { "--debug" },
            -- 		cwd = "${workspaceFolder}",
            -- 	},
            -- 	{
            -- 		type = "java",
            -- 		request = "attach",
            -- 		name = "Custom - Attach to Running JVM",
            -- 		hostName = "127.0.0.1",
            -- 		port = 5005,
            -- 	},
            -- }
            --
        },

        opts = function(_, opts)
            local dap = require("dap")

            dap.adapters.dart = {
                type = "executable",
                -- command = "dart-debug-adapter",
                command = "dart",
                args = { "debug_adapter" },
            }
            dap.adapters.flutter = {
                type = "executable",
                command = "flutter", -- if you're using fvm, you'll need to provide the full path to flutter (flutter.bat for windows users), or you could prepend the fvm command
                args = { "debug_adapter" },
                -- windows users will need to set 'detached' to false
                -- options = {
                --     detached = false,
                -- },
            }

            dap.configurations.dart = {
                {
                    type = "dart",
                    request = "launch",
                    name = "Debug Dart File",
                    program = "${file}", -- Current file
                    dartSdkPath = "/home/pguedes/software/flutter/bin/cache/dart-sdk",
                    flutterSdkPath = "/home/pguedes/software/flutter",
                    cwd = "${workspaceFolder}",
                },
                {
                    type = "flutter",
                    request = "launch",
                    name = "Launch flutter",
                    dartSdkPath = "/home/pguedes/software/flutter/bin/cache/dart-sdk",
                    flutterSdkPath = "/home/pguedes/software/flutter",
                    program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
                    cwd = "${workspaceFolder}",
                },
            }

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

            -- Add the Maven compile hook
            dap.listeners.before.event_initialized["maven-compile"] = function(session, body)
                if session.config.type == "java" then
                    -- Run `mvn compile` before starting the debug session
                    local handle = io.popen("mvn compile")
                    local result = handle:read("*a")
                    handle:close()

                    -- Check if the compilation was successful
                    if result:find("BUILD SUCCESS") then
                        vim.notify("mvn compile succeeded!", vim.log.levels.INFO)
                    else
                        vim.notify("mvn compile failed!", vim.log.levels.ERROR)
                        -- Optionally, stop the debug session if compilation fails
                        error("Compilation failed. Debug session aborted.")
                    end
                end
            end
        end,
    },
    {
        "ldelossa/nvim-dap-projects",
        event = "VeryLazy",
        config = function()
            require("nvim-dap-projects").search_project_config()
        end,
    },
}

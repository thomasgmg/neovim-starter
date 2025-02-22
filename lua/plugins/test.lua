-- ~/.config/nvim/lua/plugins/test.lua
return {
    {
        "rcasia/neotest-java",
        event = "VeryLazy",
    },
    {
        "nvim-neotest/neotest",
        event = "VeryLazy",
        opts = { adapters = { "neotest-java" } },
    },
}

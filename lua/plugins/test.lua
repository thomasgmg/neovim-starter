-- ~/.config/nvim/lua/plugins/test.lua
return {
    { "rcasia/neotest-java" },
    {
        "nvim-neotest/neotest",
        opts = { adapters = { "neotest-java" } },
    },
}

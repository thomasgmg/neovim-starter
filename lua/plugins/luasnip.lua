return {
    "L3MON4D3/LuaSnip",
    lazy = true,
    opts = {},

    config = function(_, opts)
        require("snippets.lua")
        require("snippets.go")
    end,
}

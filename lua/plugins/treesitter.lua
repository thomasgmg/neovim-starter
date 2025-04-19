return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = { "dart" },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "VeryLazy",
    },
}

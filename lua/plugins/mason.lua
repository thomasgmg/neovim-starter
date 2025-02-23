return {
    "williamboman/mason.nvim",
    opts = {
        ensure_installed = {
            "ols",
            "clangd",
            "pyright",
            "jdtls",
            "lemminx",
            "debugpy",
            "c3-lsp",
        },
    },
}

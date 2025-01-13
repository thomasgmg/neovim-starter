return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            diagnostics = {
                virtual_text = false,
            },
            servers = {
                ols = {},
                clangd = {},
            },
        },
    },
}

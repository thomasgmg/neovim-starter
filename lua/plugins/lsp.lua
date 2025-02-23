return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            diagnostics = {
                virtual_text = false,
            },
            servers = {
                dartls = false,
                ols = {},
                c3_lsp = {
                    filetypes = { "c3", "c3i" },
                },
                clangd = {
                    filetypes = { "c", "cpp", "objc", "objcpp" },
                },
                pyright = {},
                jdtls = {
                    settings = {
                        java = {
                            project = {
                                sourcePaths = {
                                    "src/main/java",
                                    "src/test/java",
                                    "target/generated-sources/protobuf/java",
                                    "target/generated-sources/annotations",
                                },
                            },
                        },
                    },
                },
            },
            setup = {
                clangd = function(_, opts)
                    opts.capabilities.offsetEncoding = { "utf-16" }
                end,
            },
        },
    },
}

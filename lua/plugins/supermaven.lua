return {
    {
        "supermaven-inc/supermaven-nvim",
        opts = {
            keymaps = {
                accept_suggestion = "<Tab>",
                clear_suggestion = "<C-]>",
                accept_word = "<C-j>",
            },
            disable_inline_completion = false,
            ignore_filetypes = { "bigfile", "snacks_input", "snacks_notif" },
        },
    },
}

-- nvim-cmp is an extra and needs to be enabled on LazyExtras in order to be able to fetch the default lazyvim configuration
-- this is saved in lazyvim.json
return {
    {
        "saghen/blink.cmp",
        -- ops = {
        --     -- completion = {
        --     --     menu = {
        --     --         auto_show = false,
        --     --     },
        --     -- },
        --     -- Don't show completion menu until I press ctrl-space.
        --     completion = {
        --         menu = {
        --             enabled = false,
        --             auto_show = false,
        --         },
        --         trigger = {
        --             show_on_insert_on_trigger_character = false,
        --             show_on_accept_on_trigger_character = false,
        --             show_on_blocked_trigger_characters = false,
        --             show_in_snippet = false,
        --             show_on_keyword = false,
        --             show_on_trigger_character = false,
        --         },
        --         list = {
        --             selection = {
        --                 auto_insert = false,
        --             },
        --         },
        --         ghost_text = {
        --             enabled = false,
        --         },
        --     },
        --     sources = {
        --         providers = {
        --             lsp = {
        --                 enabled = false,
        --             },
        --         },
        --     },
        -- },
        config = function(_, opts)
            opts.completion.menu.auto_show = false
            -- opts.keymap = opts.keymap or {}
            -- opts.keymap["<C-Space>"] = { "show" }
            -- function(cmp)
            --     cmp.show({ providers = { "snippets" } })
            -- end,
            -- }
            opts.keymap.preset = "super-tab"
            -- ["<C-e>"] = { "show_documentation" },
            -- function(cmp)
            --     cmp.show({ providers = { "snippets" } })
            -- end,
            -- },
            -- }
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            opts.completion.autocomplete = false
        end,
    },
}

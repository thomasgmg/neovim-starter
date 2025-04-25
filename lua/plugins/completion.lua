return {
    -- {
    --     "giuxtaposition/blink-cmp-copilot",
    --     event = "VeryLazy",
    -- },
    {
        "saghen/blink.cmp",
        event = "VeryLazy",
        -- version = "*",

        opts = {
            -- Completion triggering behavior
            completion = {
                trigger = {
                    show_on_keyword = true, -- Normal keyword triggering
                    show_on_trigger_character = true, -- Immediate trigger on `.`, `->`, etc.
                    show_on_insert_on_trigger_character = true,
                    prefetch_on_insert = false,
                    show_in_snippet = false,
                    -- min_keyword_length = 2, -- Default for keywords, overridden for trigger chars
                },
                accept = {
                    auto_brackets = {
                        enabled = false,
                    },
                },
            },

            -- Source configuration
            sources = {
                default = { "lsp" }, -- LSP drives the show
                providers = {
                    dadbod = {
                        name = "Dadbod",
                        module = "vim_dadbod_completion.blink",
                        enabled = true,
                        min_keyword_length = 0, -- Trigger instantly after `.`, `->`, etc.
                        score_offset = 100, -- Prioritize LSP suggestions
                        max_items = 5, -- Keep it manageable
                    },
                    lsp = {
                        opts = {},
                        enabled = true,
                        min_keyword_length = 0, -- Trigger instantly after `.`, `->`, etc.
                        score_offset = 100, -- Prioritize LSP suggestions
                        max_items = 5, -- Keep it manageable
                    },
                    snippets = {
                        enabled = true,
                        min_keyword_length = 2, -- Snippets wait for more input
                        score_offset = 3,
                    },
                    buffer = {
                        enabled = true,
                        min_keyword_length = 0, -- Buffer stays out of the way
                        score_offset = 80,
                        max_items = 5,
                    },
                    path = {
                        enabled = true,
                        min_keyword_length = 0,
                        score_offset = 90,
                    },
                    copilot = {
                        enabled = false,
                    },
                },
            },

            -- Fuzzy matching and sorting
            fuzzy = {
                sorts = { "score", "label" },
                use_frecency = true,
                -- proximity_bonus = 5,
            },

            -- Keybindings
            keymap = {
                preset = "default",

                -- ["<Tab>"] = {
                --     function(cmp)
                --         if cmp.is_menu_visible() then
                --             cmp.accept()
                --         else
                --             vim.api.nvim_feedkeys(
                --                 vim.api.nvim_replace_termcodes("<Tab>", true, false, true),
                --                 "n",
                --                 false
                --             )
                --         end
                --     end,
                -- },
                ["<C-Space>"] = {
                    function(cmp)
                        cmp.show()
                    end,
                },
                ["<C-j>"] = {
                    function(cmp)
                        cmp.select_next()
                    end,
                },
                ["<C-k>"] = {
                    function(cmp)
                        cmp.select_prev()
                    end,
                },
            },

            -- Window settings
            -- windows = {
            --     autocomplete = {
            --         max_height = 10,
            --         border = "single",
            --     },
            -- },
        },

        -- opts = function(_, opts)
        --     opts.completion.menu.auto_show = false
        --     opts.completion.ghost_text.enabled = false
        --
        --     opts.completion.list = {
        --         selection = {
        --             auto_insert = true,
        --             preselect = true,
        --         },
        --     }
        --     opts.completion.documentation = { auto_show = false }
        --
        --     opts.signature = { enabled = false }
        --
        --     -- opts.completion.trigger = {
        --     --     show_in_snippet = false,
        --     -- }
        --
        --     opts.sources = {
        --         -- adding any nvim-cmp sources here will enable them with blink.compat
        --         compat = {},
        --         default = { "lsp", "omni", "path", "snippets", "buffer" },
        --     }
        --
        --     opts.keymap = {
        --         preset = "none",
        --         ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        --         ["<C-e>"] = { "hide" },
        --         ["<C-y>"] = { "select_and_accept" },
        --         ["<C-l>"] = { "select_and_accept" },
        --         -- Tab doesnt work well
        --         -- ["Tab"] = { "select_and_accept" },
        --
        --         ["<Up>"] = { "select_prev", "fallback" },
        --         ["<Down>"] = { "select_next", "fallback" },
        --         ["<C-k>"] = { "select_prev", "fallback" },
        --         ["<C-j>"] = { "select_next", "fallback" },
        --
        --         ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        --         ["<C-f>"] = { "scroll_documentation_down", "fallback" },
        --
        --         -- by default is C-k so remap this
        --         ["<C-S>"] = { "show_signature", "hide_signature", "fallback" },
        --     }
        -- end,
    },
}

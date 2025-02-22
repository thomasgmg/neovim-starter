if true then
    return {}
end

return {
    -- add gruvbox
    "j-morano/buffer_manager.nvim",
    event = "VeryLazy",

    config = function()
        require("buffer_manager").setup({
            order_buffers = "lastused",
            focus_alternate_buffer = true,
            loop_nav = true,
            short_file_names = true,
            width = 80,
            height = 0.9,

            select_menu_item_commands = {
                edit = {
                    key = "l",
                    command = "edit",
                },
            },
        })

        local buffer_manager = require("buffer_manager.ui")

        vim.keymap.set("n", "<S-Tab>", function()
            buffer_manager.toggle_quick_menu()
        end, {
            desc = "Open/Toggle Buffer Manager or Move Down",
            noremap = true,
            silent = true,
        })

        vim.keymap.set("n", "k", function()
            if buffer_manager.is_menu_open and buffer_manager.is_menu_open() then
                buffer_manager.nav_prev()
            end
        end, {
            desc = "Move Up in Buffer Manager Menu",
            noremap = true,
            silent = true,
        })

        -- Navigate up in the menu with <C-S-Tab>
        vim.keymap.set("n", "j", function()
            if buffer_manager.is_menu_open and buffer_manager.is_menu_open() then
                buffer_manager.nav_next()
            end
        end, {
            desc = "Move Up in Buffer Manager Menu",
            noremap = true,
            silent = true,
        })
    end,
}

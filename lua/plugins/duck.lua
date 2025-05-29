return {
    "tamton-aquib/duck.nvim",
    config = function()
        -- Function to randomly choose an emoji
        local function random_emoji()
            local emojis = { "👾", "🦆" } -- Alien and duck emojis
            return emojis[math.random(1, #emojis)] -- Pick randomly
        end

        -- Keybindings
        vim.keymap.set("n", "<leader>dd", function()
            require("duck").hatch(random_emoji(), 7)
        end, { desc = "Hatch a random alien or duck with speed 2" })
        vim.keymap.set("n", "<leader>dk", function()
            require("duck").cook()
        end, { desc = "Cook a duck" })
        vim.keymap.set("n", "<leader>da", function()
            require("duck").cook_all()
        end, { desc = "Cook all ducks" })

        -- Single :Duck command with arguments
        vim.api.nvim_create_user_command("Duck", function(opts)
            local duck = require("duck")
            if opts.args == "hatch" then
                duck.hatch(random_emoji(), 7)
            elseif opts.args == "cook" then
                duck.cook()
            elseif opts.args == "cook_all" then
                duck.cook_all()
            else
                vim.api.nvim_echo({ { "Unknown Duck command: " .. opts.args, "ErrorMsg" } }, false, {})
            end
        end, { nargs = 1, desc = "Duck plugin commands" }) -- Expect one argument
    end,
}

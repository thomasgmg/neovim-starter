_G.fzf_dirs = function(opts)
    local fzf_lua = require("fzf-lua")
    opts = opts or {}
    opts.prompt = "Directories> "

    opts.fn_transform = function(x)
        return fzf_lua.utils.ansi_codes.magenta(x)
    end
    opts.actions = {
        ["default"] = function(selected)
            -- vim.cmd("cd " .. selected[1])
            local dir = selected[1]
            vim.cmd("Oil " .. vim.fn.fnameescape(dir))
        end,
    }
    fzf_lua.fzf_exec("fdfind --type d", opts)
end

vim.keymap.set("n", "<leader>sx", _G.fzf_dirs, { desc = "Directories" })

-- We can also send call options directly
-- :lua _G.fzf_dirs({ cwd = <other directory> })

vim.api.nvim_create_user_command("SearchDir", function(opts)
    local dir = { cwd = opts.args ~= "" and opts.args or nil }
    _G.fzf_dirs(dir)
end, {
    nargs = "?",
    complete = "dir",
})

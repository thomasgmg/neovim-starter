return {
    "okuuva/auto-save.nvim",
    version = "*", -- see https://devhints.io/semver, alternatively use '*' to use the latest tagged release
    -- cmd = "ASToggle", -- optional for lazy loading on command
    event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
    keys = {
        { "<leader>bs", "<cmd>ASToggle<CR>", desc = "Toggle auto-save" },
    },
    opts = {
        -- your config goes here
        -- or just leave it empty :)
        condition = function(buf)
            -- don't save for special-buffers
            if vim.fn.getbufvar(buf, "&buftype") ~= "" then
                return false
            end

            -- don't save buffers out of root dir
            --
            -- Get the current buffer's file path
            local filepath = vim.api.nvim_buf_get_name(buf)

            -- If there's no filepath (e.g., new unsaved buffer), allow saving
            if filepath == "" then
                return true
            end

            -- Get the root directory where Neovim was opened
            local root_dir = vim.fn.getcwd()

            -- Convert paths to absolute paths and ensure proper separators
            local abs_filepath = vim.fn.resolve(vim.fn.fnamemodify(filepath, ":p"))
            local abs_root_dir = vim.fn.resolve(root_dir) .. "/"

            -- Check if the file path starts with the root directory
            if abs_filepath:sub(1, #abs_root_dir) ~= abs_root_dir then
                return false
            end

            return true
        end,
    },
}

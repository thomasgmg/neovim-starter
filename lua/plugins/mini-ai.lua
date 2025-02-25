return {
    "echasnovski/mini.ai",
    event = "VeryLazy",

    opts = {
        custom_textobjects = {
            -- Define 'e' as a text object for the entire buffer
            e = function(ai_type)
                local from_line = 1
                local to_line = vim.fn.line("$") -- Last line of the buffer

                if ai_type == "i" then
                    -- For 'ie' (inner entire), exclude leading/trailing empty lines
                    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
                    local first_non_empty = 1
                    local last_non_empty = #lines

                    -- Find first non-empty line
                    for i, line in ipairs(lines) do
                        if line:match("^%s*$") then
                            first_non_empty = i + 1
                        else
                            break
                        end
                    end

                    -- Find last non-empty line
                    for i = #lines, 1, -1 do
                        if lines[i]:match("^%s*$") then
                            last_non_empty = i - 1
                        else
                            break
                        end
                    end

                    -- Adjust selection range
                    from_line = first_non_empty
                    to_line = last_non_empty
                end

                -- Return the region specification
                return {
                    from = { line = from_line, col = 1 },
                    to = { line = to_line, col = #vim.api.nvim_buf_get_lines(0, to_line - 1, to_line, false)[1] },
                }
            end,
        },
    },
}

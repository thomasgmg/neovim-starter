local cellular = require("cellular-automaton")

-- Slide animation
local slide_config = {
    fps = 50,
    name = "slide",
}
slide_config.update = function(grid)
    for i = 1, #grid do
        local prev = grid[i][#grid[i]]
        for j = 1, #grid[i] do
            grid[i][j], prev = prev, grid[i][j]
        end
    end
    return true
end
cellular.register_animation(slide_config)

-- Wave animation
local wave_config = {
    fps = 15,
    name = "wave",
}
wave_config.update = function(grid)
    local n_rows = #grid
    -- Find maximum row length to handle full buffer width
    local max_cols = 0
    for i = 1, n_rows do
        max_cols = math.max(max_cols, #grid[i])
    end

    local new_grid = {}
    -- Initialize new_grid with the same structure as grid
    for i = 1, n_rows do
        new_grid[i] = {}
        for j = 1, max_cols do
            new_grid[i][j] = grid[i][j] or " " -- Pad with spaces if line is shorter
        end
    end

    -- Create wave effect by shifting each row based on a sine function
    for i = 1, n_rows do
        local offset = math.floor(math.sin(os.clock() + i * 0.5) * 2) -- Sine-based offset
        for j = 1, max_cols do
            local new_j = (j + offset - 1) % max_cols + 1 -- Circular shift within row
            new_grid[i][j] = grid[i][new_j] or " " -- Use original grid, pad if needed
        end
    end

    -- Copy new_grid back to grid
    for i = 1, n_rows do
        for j = 1, max_cols do
            grid[i][j] = new_grid[i][j]
        end
    end

    return true
end
cellular.register_animation(wave_config)

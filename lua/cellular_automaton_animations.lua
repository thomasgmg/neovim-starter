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

-- Ripple animation
local ripple_config = {
    fps = 12,
    name = "ripple",
}
ripple_config.update = function(grid)
    local n_rows = #grid
    local max_cols = 0
    for i = 1, n_rows do
        max_cols = math.max(max_cols, #grid[i])
    end

    local new_grid = {}
    for i = 1, n_rows do
        new_grid[i] = {}
        for j = 1, max_cols do
            new_grid[i][j] = grid[i][j] or " "
        end
    end

    local center_i, center_j = n_rows / 2, max_cols / 2
    for i = 1, n_rows do
        for j = 1, max_cols do
            local dist = math.sqrt((i - center_i) ^ 2 + (j - center_j) ^ 2)
            local offset = math.floor(math.sin(os.clock() * 2 - dist * 0.2) * 2)
            local new_i = (i + offset - 1) % n_rows + 1
            local new_j = (j + offset - 1) % max_cols + 1
            new_grid[i][j] = grid[new_i][new_j] or " "
        end
    end

    for i = 1, n_rows do
        for j = 1, max_cols do
            grid[i][j] = new_grid[i][j]
        end
    end

    return true
end
cellular.register_animation(ripple_config)

-- Jump animation
local jump_config = {
    fps = 15,
    name = "jump",
}
jump_config.update = function(grid)
    local n_rows = #grid
    local max_cols = 0
    for i = 1, n_rows do
        max_cols = math.max(max_cols, #grid[i])
    end

    local new_grid = {}
    for i = 1, n_rows do
        new_grid[i] = {}
        for j = 1, max_cols do
            new_grid[i][j] = grid[i][j] or " "
        end
    end

    for j = 1, max_cols do
        local offset = math.floor(math.cos(os.clock() * 2 + j * 0.3) * 2) -- Cosine-based vertical offset
        for i = 1, n_rows do
            local new_i = (i + offset - 1) % n_rows + 1 -- Circular shift within column
            new_grid[i][j] = grid[new_i][j] or " "
        end
    end

    for i = 1, n_rows do
        for j = 1, max_cols do
            grid[i][j] = new_grid[i][j]
        end
    end

    return true
end
cellular.register_animation(jump_config)

-- Pulse animation
local pulse_config = {
    fps = 15,
    name = "pulse",
}
pulse_config.update = function(grid)
    local n_rows = #grid
    local max_cols = 0
    for i = 1, n_rows do
        max_cols = math.max(max_cols, #grid[i])
    end

    local new_grid = {}
    for i = 1, n_rows do
        new_grid[i] = {}
        for j = 1, max_cols do
            new_grid[i][j] = grid[i][j] or " "
        end
    end

    local center_i, center_j = n_rows / 2, max_cols / 2
    for i = 1, n_rows do
        for j = 1, max_cols do
            local di, dj = i - center_i, j - center_j
            local dist = math.sqrt(di ^ 2 + dj ^ 2)
            local offset = math.floor(math.cos(os.clock() * 2 + dist * 0.1) * 2) -- Cosine-based radial offset
            local angle = math.atan2(dj, di)
            local new_i = math.floor(i + math.cos(angle) * offset)
            local new_j = math.floor(j + math.sin(angle) * offset)
            new_i = (new_i - 1) % n_rows + 1
            new_j = (new_j - 1) % max_cols + 1
            new_grid[i][j] = grid[new_i][new_j] or " "
        end
    end

    for i = 1, n_rows do
        for j = 1, max_cols do
            grid[i][j] = new_grid[i][j]
        end
    end

    return true
end
cellular.register_animation(pulse_config)

-- Vortex animation
local vortex_config = {
    fps = 15,
    name = "vortex",
}
vortex_config.update = function(grid)
    local n_rows = #grid
    local max_cols = 0
    for i = 1, n_rows do
        max_cols = math.max(max_cols, #grid[i])
    end

    local new_grid = {}
    for i = 1, n_rows do
        new_grid[i] = {}
        for j = 1, max_cols do
            new_grid[i][j] = grid[i][j] or " "
        end
    end

    local center_i, center_j = n_rows / 2, max_cols / 2
    local direction = math.cos(os.clock() * 0.5) > 0 and 1 or -1 -- Reverse direction every ~6 seconds
    for i = 1, n_rows do
        for j = 1, max_cols do
            local di, dj = i - center_i, j - center_j
            local radius = math.sqrt(di ^ 2 + dj ^ 2)
            local angle = math.atan2(dj, di) + direction * os.clock() * (0.5 / (radius + 1)) -- Slower rotation farther out
            local new_i = math.floor(center_i + radius * math.cos(angle))
            local new_j = math.floor(center_j + radius * math.sin(angle))
            new_i = (new_i - 1) % n_rows + 1
            new_j = (new_j - 1) % max_cols + 1
            new_grid[i][j] = grid[new_i][new_j] or " "
        end
    end

    for i = 1, n_rows do
        for j = 1, max_cols do
            grid[i][j] = new_grid[i][j]
        end
    end

    return true
end
cellular.register_animation(vortex_config)

-- Drift animation
local drift_config = {
    fps = 15,
    name = "drift",
}
drift_config.update = function(grid)
    local n_rows = #grid
    local max_cols = 0
    for i = 1, n_rows do
        max_cols = math.max(max_cols, #grid[i])
    end

    local new_grid = {}
    for i = 1, n_rows do
        new_grid[i] = {}
        for j = 1, max_cols do
            new_grid[i][j] = grid[i][j] or " "
        end
    end

    local drift_angle = math.cos(os.clock() * 0.3) * 0.2 + math.pi / 4 -- Oscillate around 45-degree angle
    local offset_x = math.floor(math.sin(os.clock() * 1.5) * 2 * math.cos(drift_angle))
    local offset_y = math.floor(math.sin(os.clock() * 1.5) * 2 * math.sin(drift_angle))
    for i = 1, n_rows do
        for j = 1, max_cols do
            local new_i = (i + offset_y - 1) % n_rows + 1
            local new_j = (j + offset_x - 1) % max_cols + 1
            new_grid[i][j] = grid[new_i][new_j] or " "
        end
    end

    for i = 1, n_rows do
        for j = 1, max_cols do
            grid[i][j] = new_grid[i][j]
        end
    end

    return true
end
cellular.register_animation(drift_config)

-- Swirl animation
local swirl_config = {
    fps = 30, -- Increased for smoother motion
    name = "swirl",
}
swirl_config.update = function(grid)
    local n_rows = #grid
    local max_cols = 0
    for i = 1, n_rows do
        max_cols = math.max(max_cols, #grid[i])
    end

    local new_grid = {}
    for i = 1, n_rows do
        new_grid[i] = {}
        for j = 1, max_cols do
            new_grid[i][j] = grid[i][j] or " "
        end
    end

    -- local center_i, center_j = n_rows / 2, max_cols / 2
    local time = os.clock()
    local orbit_radius = 3
    local angle = time * 1.5 -- Slow rotation speed
    local offset_i = math.floor(orbit_radius * math.cos(angle))
    local offset_j = math.floor(orbit_radius * math.sin(angle))

    for i = 1, n_rows do
        for j = 1, max_cols do
            local new_i = (i + offset_i - 1) % n_rows + 1
            local new_j = (j + offset_j - 1) % max_cols + 1
            new_grid[i][j] = grid[new_i][new_j] or " "
        end
    end

    for i = 1, n_rows do
        for j = 1, max_cols do
            grid[i][j] = new_grid[i][j]
        end
    end

    return true
end
cellular.register_animation(swirl_config)

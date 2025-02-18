return {
    "echasnovski/mini.operators",
    version = false,

    opts = {
      replace = { prefix = "" }, -- Disable automated mappings
    },

    config = function(_, opts)
      local operators = require("mini.operators")
      operators.setup(opts)

      -- Custom mappings mimicking 'replacewithregister'
      operators.make_mappings("replace", {
        textobject = "<leader>gr",  -- Replace text object (e.g., `grw` for word)
        line = "<leader>grr",       -- Replace whole line
        selection = "<leader>gr",   -- Replace selection
      })
    end,
}

return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- Load the plugin before starting to read a buffer
  config = function()
    require("persistence").setup({
      need = 0,
    })
  end,
}

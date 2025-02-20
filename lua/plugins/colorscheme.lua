-- lua/plugins/jetbrains-dark.lua

return {
  {
    dir = vim.fn.stdpath("config"), -- Points to ~/.config/nvim
    name = "jetbrains-dark",
    lazy = false,
    priority = 1000, -- Load early
    config = function()
      require("colors.jetbrains-dark").setup()
    end,
  },
}

-- lua/plugins/jetbrains-dark.lua
-- https://grok.com/share/bGVnYWN5_6adaf8e3-9d1f-40d6-be44-dfef9d16100d

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

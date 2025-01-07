return {
  -- add gruvbox
  "j-morano/buffer_manager.nvim",
  config = function()
    require("buffer_manager").setup({
      order_buffers = "lastused",
    })
  end,
}

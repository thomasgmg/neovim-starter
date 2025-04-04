-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 4 -- Number of spaces for indentation
vim.opt.tabstop = 4 -- Number of spaces a <Tab> counts for
vim.opt.softtabstop = 4 -- Number of spaces for a <Tab> in insert mode
vim.opt.scrolloff = 10 -- Lines of context

--  set global autoformat
vim.g.autoformat = true

vim.g.lazyvim_python_lsp = "pyright"

-- let g:table_mode_map_prefix = '<Leader>t'
vim.g.table_mode_map_prefix = "<Leader>m"

vim.opt.wrap = true

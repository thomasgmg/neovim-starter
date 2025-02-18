if true then return {} end

return {
    "vim-scripts/ReplaceWithRegister",
    config = function()
		vim.api.nvim_set_keymap('n', '<leader>gr', '<Plug>ReplaceWithRegisterOperator', { noremap = false, silent = true })
	end,
}

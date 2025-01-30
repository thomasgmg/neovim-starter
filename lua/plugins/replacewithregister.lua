return {
    "vim-scripts/ReplaceWithRegister",
    config = function()
		vim.api.nvim_set_keymap('n', 'rr', '<Plug>ReplaceWithRegisterOperator', { noremap = false, silent = true })
	end,
}

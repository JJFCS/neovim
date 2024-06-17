return {

	'nvim-telescope/telescope.nvim',
		branch = '0.1.x',  -- release branch
		dependencies = { 'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },  -- only load when `make' is available
		},

		config = function()
			require('telescope').setup({})
			pcall(require('telescope').load_extension, 'fzf')
		end

}


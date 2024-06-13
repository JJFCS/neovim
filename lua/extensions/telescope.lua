return {

	"nvim-telescope/telescope.nvim",
		branch = "0.1.x",  -- release branch
		dependencies = { "nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },  -- run some command when plugin is installed or updated == `build'
		},

		config = function()

			-- [[ Customising Telescope ]]
			--    See `:help telescope' & `:help telescope.setup()'
			require('telescope').setup({})

			-- enable Telescope extensions
			pcall(require('telescope').load_extension, 'fzf')

			-- See `:help telescope.builtin'
			local builtin = require('telescope.builtin')
			vim.keymap.set("n", "<leader>ff", builtin.find_files,                { desc = "[F]ind [F]iles" })
			vim.keymap.set("n", "<leader>gf", builtin.git_files,                 { desc = "[G]it  [F]iles" })
			vim.keymap.set("n", "<leader>sc", builtin.commands,                  { desc = "[S]earch [C]ommands" })
			vim.keymap.set("n", "<leader>sg", builtin.live_grep,                 { desc = "[S]earch [G]rep" })
			vim.keymap.set("n", "<leader>sh", builtin.help_tags,                 { desc = "[S]earch [H]elp" })
			vim.keymap.set("n", "<leader>sk", builtin.keymaps,                   { desc = "[S]earch [K]eymaps" })
			vim.keymap.set("n", "<leader>sw", builtin.grep_string,               { desc = "[S]earch [W]ord" })
			vim.keymap.set("n", "<leader>/",  builtin.current_buffer_fuzzy_find, { desc = "[/] Fuzzily search in current buffer" })

		end

}


return {

	{ "nvim-telescope/telescope.nvim",
		event  = "VimEnter",
		branch = "0.1.x",  -- release branch (get consistent updates)
		dependencies = { "nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
		},


		-- Two important keymaps to use while in Telescope are:
		--  - Insert mode: <c-/>
		--  - Normal mode: ?
		--
		-- Shows you all of the keymaps for the current Telescope picker


		config = function()

			-- [[ Configure Telescope ]]
			--    See `:help telescope` and `:help telescope.setup()`
			require('telescope').setup({})

			-- enable Telescope extensions if they are installed
			pcall(require("telescope").load_extension, "fzf")

			-- See `:help telescope.builtin`
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff",       builtin.find_files,                { desc = "[F]ind [F]iles" })
			vim.keymap.set("n", "<leader>gf",       builtin.git_files,                 { desc = "[G]it  [F]iles" })
			vim.keymap.set("n", "<leader>sc",       builtin.commands,                  { desc = "[S]earch [C]ommands" })
			vim.keymap.set("n", "<leader>sg",       builtin.live_grep,                 { desc = "[S]earch [G]rep" })
			vim.keymap.set("n", "<leader>sh",       builtin.help_tags,                 { desc = "[S]earch [H]elp" })
			vim.keymap.set("n", "<leader>sk",       builtin.keymaps,                   { desc = "[S]earch [K]eymaps" })
			vim.keymap.set("n", "<leader>sw",       builtin.grep_string,               { desc = "[S]earch [W]ord" })
			vim.keymap.set("n", "<leader>/",        builtin.current_buffer_fuzzy_find, { desc = "[/] Fuzzily search in current buffer" })
			vim.keymap.set("n", "<leader><leader>", builtin.buffers,                   { desc = "[ ] Find existing buffers" })


			-- Slightly advanced example of overriding default behavior and theme
			-- You can pass additional configuration to Telescope to change the theme, layout, etc.

			-- It's also possible to pass additional configuration options.
			-- See `:help telescope.builtin.live_grep()` for information about particular keys
			vim.keymap.set("n", "<leader>s/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title    = "Live Grep in Open Files",
				})
			end, { desc = "[S]earch [/] in Open Files" })
		end
	}
}


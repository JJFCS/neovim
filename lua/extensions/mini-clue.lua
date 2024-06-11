return {

	"echasnovski/mini.clue",
		config = function()
			local miniclue = require('mini.clue')
			miniclue.setup({

				triggers = {
					-- Leader Triggers
					{ mode = 'n', keys = '<Leader>' },
					{ mode = 'x', keys = '<Leader>' },

					-- Built-in Completion
					{ mode = 'i', keys = '<C-x>' },

					-- KEY == `g'
					{ mode = 'n', keys = 'g' },
					{ mode = 'x', keys = 'g' },

					-- Marks
					{ mode = 'n', keys = "'" },
					{ mode = 'n', keys = '`' },
					{ mode = 'x', keys = "'" },
					{ mode = 'x', keys = '`' },

					-- Registers
					{ mode = 'n', keys = '"' },
					{ mode = 'x', keys = '"' },
					{ mode = 'i', keys = '<C-r>' },
					{ mode = 'c', keys = '<C-r>' },

					-- Commands == windows
					{ mode = 'n', keys = '<C-w>' },

					-- KEY == `z'
					{ mode = 'n', keys = 'z' },
					{ mode = 'x', keys = 'z' },
				},


				clues = {
					-- Enhance this by adding descriptions for <Leader> mapping groups
					miniclue.gen_clues.builtin_completion(),
					miniclue.gen_clues.g(),
					miniclue.gen_clues.marks(),
					miniclue.gen_clues.registers(),
					miniclue.gen_clues.windows(),
					miniclue.gen_clues.z(),
				},
			})
		end,
}


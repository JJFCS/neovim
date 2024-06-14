return {

	-- incompetent to place cmp-cmdline in main/global 'cmp setup' as completion sources
	-- gets polluted with neovim variables/functions... hence, include cmp-cmdline in its own setup function
	--
	-- Completions for `/' search based on the current buffer
	-- Completions for `:' command mode

	{ "hrsh7th/cmp-cmdline",
		config = function()
			local cmp = require('cmp')
			cmp.setup.cmdline('/', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = 'buffer' }
				}
			})

			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = 'path' },
					{ name = 'cmdline' },
				})
			})
		end
	},
}


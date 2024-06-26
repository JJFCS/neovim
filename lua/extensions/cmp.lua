return {

	{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
	{ 'rafamadriz/friendly-snippets',
			config = function()
				require('luasnip.loaders.from_vscode').lazy_load()
			end
	},


	{ "hrsh7th/nvim-cmp", event = "InsertEnter",
		config = function()
			local cmp     = require('cmp')
			local luasnip = require('luasnip')
			luasnip.config.setup({})

			-- Global setup.
			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)  -- For `luasnip` users
					end,
				},
				completion = { completeopt = "menu,menuone,noinsert" },
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end,
					["<C-p>"] = function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end,
					[ "<C-Space>" ] = cmp.mapping.complete({}),  -- MANUALLY TRIGGER COMPLETION
					[   "<C-e>"   ] = cmp.mapping.close(),
					[   "<C-y>"   ] = cmp.mapping.confirm({ select = true }),
				}),

				sources = {
					{ name = 'buffer'   },
					{ name = 'luasnip'  },
					{ name = 'nvim_lsp' },
					{ name = 'path'     },
				},
			})
		end
	},
}


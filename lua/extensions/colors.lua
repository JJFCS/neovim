return {

	{
		-- Change the name of the colorscheme plugin below, and then
		-- change the command in the config to whatever the name of that colorscheme is.
		--
		-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
		"echasnovski/mini.base16",
			priority = 1000, -- Make sure to load this before all the other start plugins.
			config   = function()
				require('mini.base16').setup({
					palette = {
						base00 = "#161616",
						base01 = "#262626",
						base02 = "#393939",
						base03 = "#525252",
						base04 = "#dde1e6",
						base05 = "#f2f4f8",
						base06 = "#ffffff",
						base07 = "#08bdba",
						base08 = "#3ddbd9",
						base09 = "#78a9ff",
						base0A = "#ee5396",
						base0B = "#33b1ff",
						base0C = "#ff7eb6",
						base0D = "#42be65",
						base0E = "#be95ff",
						base0F = "#82cfff",
					},
					use_cterm = true,
				})
			end,
	},
}


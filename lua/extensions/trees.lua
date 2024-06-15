return {

	{ "mbbill/undotree" },

	{ "nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts  = {
			ensure_installed = { "c", "cpp", "lua", "luadoc", "markdown", "markdown_inline", "python", "vim", "vimdoc" },
			sync_install = false,
			auto_install = true,  -- brew / sudo pacman -S `TREESITTER' CLI (local installation on system)
			highlight    = {
				enable   = true,
			},
			indent = { enable = true },
		},

		config = function(_, opts)
			require("nvim-treesitter.install").prefer_git = true
			require("nvim-treesitter.configs").setup(opts)
		end
	}
}


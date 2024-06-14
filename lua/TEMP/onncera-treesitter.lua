return {

	"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts  = {
			ensure_installed = { "c", "cpp", "lua", "luadoc", "markdown", "markdown_inline", "python", "vim", "vimdoc" },
			sync_install = false,  -- ONLY APPLIES TO `ENSURE_INSTALLED'
			auto_install = true,   -- INSTALL `TREE-SITTER' CLI LOCALLY
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


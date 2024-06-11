return {

	"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts  = {
			ensure_installed = {
				"c", "cpp", "lua", "luadoc",
				"markdown", "python", "vim", "vimdoc",
			},
			sync_install = false,

			-- Autoinstall languages that are not installed
			-- Set `auto_install = false` if you do not have `tree-sitter-cli` installed locally
			auto_install = true,
			highlight    = {
				enable   = true,
			},
			indent = { enable = true },
		},

		-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
		config = function(_, opts)

			-- Prefer git instead of curl in order to improve connectivity in some environments
			require("nvim-treesitter.install").prefer_git = true
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup(opts)
		end,
}


return {

	"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },  -- NOTE: must be loaded before dependants
			  "williamboman/mason-lspconfig.nvim",
			  "WhoIsSethDaniel/mason-tool-installer.nvim",
			  "hrsh7th/cmp-buffer",
			  "hrsh7th/cmp-cmdline",
			  "hrsh7th/cmp-nvim-lsp",
			  "hrsh7th/cmp-path",
			  "hrsh7th/nvim-cmp",
			  "L3MON4D3/LuaSnip",
			  "saadparwaiz1/cmp_luasnip",
			  "j-hui/fidget.nvim",
		},


		config = function()
			require("fidget").setup({})
			local cmp_lsp      = require("cmp_nvim_lsp")
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				cmp_lsp.default_capabilities()
			)


			local servers = {
				clangd = {filetypes = { "c", "cpp" }},
				lua_ls = {
					settings = {
						Lua  = {
							completion  = {callSnippet = "Replace"},
							diagnostics = {globals     = { "vim" }},
						},
					},
				},
			}
			local ensure_installed = vim.tbl_keys(servers or {})


			require("mason").setup()
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						-- Handles overriding only values explicitly passed by the server configuration above.
						-- Helpful when disabling certain features of an LSP (for example, turning off formatting for tsserver)
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end
				},
			})


			-- OCD purposes (redundant)
			vim.api.nvim_create_autocmd("LspDetach", {
				group    = vim.api.nvim_create_augroup("onncera-lsp-detach", { clear = true }),
				callback = function() vim.lsp.buf.clear_references() end
			})


		end

}

